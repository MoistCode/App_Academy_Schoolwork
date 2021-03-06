require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'
require 'byebug'



class ControllerBase
  attr_reader :req, :res, :params, :session

  # Setup the controller
  def initialize(req, res)
    @req, @res = req, res
    @already_built = false
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built
  end

  # Set the response status code and header
  def redirect_to(url)
    raise 'You dun fucked up' if already_built_response?
    res['location'] = url
    res.status = 302
    @already_built = true
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise 'You dun doubly fucked up' if already_built_response?
    @res['Content-Type'] = content_type
    @res.body = [content]
    @already_built = true
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    raise if already_built_response?
    class_name = self.class.to_s
    class_name_capture = class_name.match(/(.+)Controller/)[1].downcase

    final_path = "#{Dir.pwd}/views/#{class_name_capture}_controller/#{template_name.to_s}.html.erb"

    html_file = File.read(final_path)
    rendered_html = ERB.new(html_file).result(binding)

    render_content(rendered_html, 'text/html')

  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req) # WTF IS GOING ON HERE
    # Oh lulz, there's a separate class ^-^
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end
