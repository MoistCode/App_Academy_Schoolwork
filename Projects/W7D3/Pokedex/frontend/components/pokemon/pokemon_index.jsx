import React from 'react';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <ul>
        {this.props.pokemon.map((poke) => <li key={poke.id}>{poke.name}<img src={poke.image_url} /></li>)}
      </ul>
    );
  }
}

export default PokemonIndex;
