
const { Student, Enrollment } = require('./models'); // Assuming models are defined

async function getAboveAverageStudents(courseId) {
  // Step 1: Retrieve enrollments for the specific course
  const enrollments = await Enrollment.findAll({
    where: { courseId },
    include: [Student]
  });

  // Step 2: Calculate the average grade
  const averageGrade = enrollments.reduce((acc, e) => acc + e.grade, 0) / enrollments.length;

  // Step 3: Filter students with above-average grades
  const aboveAverageStudents = enrollments
    .filter(e => e.grade > averageGrade)
    .map(e => ({
      studentName: e.student.name,
      grade: e.grade
    }));

  return aboveAverageStudents;
}

// Example usage
getAboveAverageStudents(101).then(result => console.log(result));
