class Student {
    constructor(first,last){
        this.first = first;
        this.last = last;
        this.courses = [];
    }
}

Student.prototype.name = function() {return `${this.first} ${this.last}`};

Student.prototype.enroll = function(course) {
    if (this.hasConflict(course)){
        console.log("Cannot add course! There's a conflict!")
    }
    else{
        console.log("Course added successfully!");
        this.courses.push(course)
    }
};

Student.prototype.hasConflict = function(course){
    let conflict = false;
    this.courses.forEach(function(x){
        if (course.conflictsWith(x)){
            conflict = true;
        }
    });
    return conflict;
}

Student.prototype.courseLoad = function() {
    load = new Map();
    this.courses.forEach(function(course){
        if (load.has(course.department)){
            let curLoad = load.get(course.department);
            load.set(course.department,curLoad+course.credits);
        }
        else{
            load.set(course.department,course.credits);
        }
    })
    return load;
}

class Course {
    constructor(name,department,credits,timeBlock,days){
        this.name = name;
        this.department = department;
        this.credits = credits;
        this.students = [];
        this.timeBlock = timeBlock;
        this.days = days;
    }
}

Course.prototype.addStudent = function(student) {
    this.students.push(student);
    student.enroll(this);
}

Course.prototype.conflictsWith = function(course){
    if (this.timeBlock === course.timeBlock){
        return this.days.filter(x => course.days.includes(x)).length > 0;
    }
    else{
        return false;
    }
}