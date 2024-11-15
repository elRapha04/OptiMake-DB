const express = require('express');
const app = express();
const port = 3000;

// Middleware to parse JSON request bodies
app.use(express.json());

// Sample in-memory data to work with
let students = [
  { id: 1, name: 'John Doe' },
  { id: 2, name: 'Jane Doe' }
];

// GET Request (Retrieve data)
app.get('/students', (req, res) => {
  res.json(students); // Respond with the list of students
});

// POST Request (Create data)
app.post('/students', (req, res) => {
  const newStudent = req.body; // Assuming the request body contains student data
  students.push(newStudent); // Add the new student to the list
  res.status(201).json(newStudent); // Respond with the created student data
});

// PUT Request (Update data)
app.put('/students/:id', (req, res) => {
  const studentId = parseInt(req.params.id);
  const updatedData = req.body;
  
  let student = students.find(s => s.id === studentId);
  if (student) {
    student.name = updatedData.name; // Update student's name (you can update other fields similarly)
    res.json(student); // Respond with the updated student data
  } else {
    res.status(404).json({ message: 'Student not found' });
  }
});

// DELETE Request (Delete data)
app.delete('/students/:id', (req, res) => {
  const studentId = parseInt(req.params.id);
  students = students.filter(s => s.id !== studentId); // Remove the student from the list
  
  res.status(200).json({ message: `Student with ID ${studentId} deleted` }); // Respond with a success message
});

// Start the server
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
