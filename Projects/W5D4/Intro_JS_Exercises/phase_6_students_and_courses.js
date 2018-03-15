function Student(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.courses = [];
}

function Course(courseName, department, numOfCredits) {
  this.courseName = courseName;
  this.department = department;
  this.numOfCredits = numOfCredits;
  this.students = [];
}

Student.prototype.name = function() {
  return `${this.firstName} ${this.lastName}`
}

Student.prototype.enroll = function(course) {
  let enrolled = false;

  for(let i = 0; i < this.courses.length; i++) {
    if (this.courses[i] === course) {
      enrolled = true;
    }
  }

  if (enrolled === false) {
    course.addStudent(this);
    this.courses.push(course);
  }
}

Course.prototype.addStudent = function(student) {
  this.students.push(student);
}

Student.prototype.courseLoad = function() {
  // Returns hash of departments to number of credits the student is taking in that department
  hsh = {};

  for(let i = 0; i < this.courses.length; i++){
    if (hsh[this.courses[i].department] === undefined) {
      hsh[this.courses[i].department] = this.courses[i].numOfCredits;
    } else {
      hsh[this.courses[i].department] += this.courses[i].numOfCredits;
    }
  }
  return hsh
}

s1 = new Student('Timmy', 'Turner');
s2 = new Student('Tommy', 'Moist');
s3 = new Student('Honey', 'Beef');

c1 = new Course('Patho101', 'Pathology', 4);
c2 = new Course('Chem101', 'Chemistry', 5);
c3 = new Course('Chem201', 'Chemistry', 4);
c4 = new Course('Physics101', 'Physics', 5);

s1.enroll(c2);
s1.enroll(c1);
s1.enroll(c3);
s1.enroll(c4);

s2.enroll(c1);
s3.enroll(c1);
