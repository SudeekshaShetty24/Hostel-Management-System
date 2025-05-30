package com.dao;

import com.model.Student;
import java.sql.*;
import java.util.*;

public class HostelDAO {

    // ✅ Get database connection
    private Connection getConnection() throws Exception {
        String url = "jdbc:mysql://localhost:3306/HostelDB";
        String user = "root";
        String password = "";
        Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure MySQL Connector/J is in classpath
        return DriverManager.getConnection(url, user, password);
    }

    // ✅ Add a new student
    public void addStudent(Student s) throws Exception {
        String sql = "INSERT INTO hostelstudents (StudentID, StudentName, RoomNumber, AdmissionDate, FeesPaid, PendingFees) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, s.getStudentID());
            ps.setString(2, s.getStudentName());
            ps.setString(3, s.getRoomNumber());
            ps.setString(4, s.getAdmissionDate());
            ps.setDouble(5, s.getFeesPaid());
            ps.setDouble(6, s.getPendingFees());
            ps.executeUpdate();
        }
    }

    // ✅ Update an existing student
    public void updateStudent(Student s) throws Exception {
        String sql = "UPDATE hostelstudents SET StudentName=?, RoomNumber=?, AdmissionDate=?, FeesPaid=?, PendingFees=? WHERE StudentID=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, s.getStudentName());
            ps.setString(2, s.getRoomNumber());
            ps.setString(3, s.getAdmissionDate());
            ps.setDouble(4, s.getFeesPaid());
            ps.setDouble(5, s.getPendingFees());
            ps.setInt(6, s.getStudentID());
            ps.executeUpdate();
        }
    }

    // ✅ Delete a student by ID
    public void deleteStudent(int studentID) throws Exception {
        String sql = "DELETE FROM hostelstudents WHERE StudentID=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, studentID);
            ps.executeUpdate();
        }
    }

    public List<Student> getAllStudents() throws Exception {
        List<Student> list = new ArrayList<>();
        Connection conn = getConnection();
        String sql = "SELECT * FROM hostelstudents";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
        while (rs.next()) {
            Student s = new Student();
            s.setStudentID(rs.getInt("StudentID"));
            s.setStudentName(rs.getString("StudentName"));
            s.setRoomNumber(rs.getString("RoomNumber"));
            s.setAdmissionDate(rs.getString("AdmissionDate"));
            s.setFeesPaid(rs.getDouble("FeesPaid"));
            s.setPendingFees(rs.getDouble("PendingFees"));
            list.add(s);
        }
        conn.close();
        return list;
    }



 // Get total fees paid by all students
    public double getTotalFeesPaid() throws Exception {
        String sql = "SELECT SUM(FeesPaid) FROM hostelstudents";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getDouble(1);
            }
        }
        return 0.0;
    }

    // Get total pending fees by all students
    public double getTotalPendingFees() throws Exception {
        String sql = "SELECT SUM(PendingFees) FROM hostelstudents";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getDouble(1);
            }
        }
        return 0.0;
    }

    // Get students who have pending fees > 0
    public List<Student> getStudentsWithPendingFees() throws Exception {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM hostelstudents WHERE PendingFees > 0";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Student s = new Student();
                s.setStudentID(rs.getInt("StudentID"));
                s.setStudentName(rs.getString("StudentName"));
                s.setRoomNumber(rs.getString("RoomNumber"));
                s.setAdmissionDate(rs.getString("AdmissionDate"));
                s.setFeesPaid(rs.getDouble("FeesPaid"));
                s.setPendingFees(rs.getDouble("PendingFees"));
                list.add(s);
            }
        }
        return list;
    }

    // Get students in a particular room
    public List<Student> getStudentsByRoom(String roomNumber) throws Exception {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM hostelstudents WHERE RoomNumber = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, roomNumber);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Student s = new Student();
                    s.setStudentID(rs.getInt("StudentID"));
                    s.setStudentName(rs.getString("StudentName"));
                    s.setRoomNumber(rs.getString("RoomNumber"));
                    s.setAdmissionDate(rs.getString("AdmissionDate"));
                    s.setFeesPaid(rs.getDouble("FeesPaid"));
                    s.setPendingFees(rs.getDouble("PendingFees"));
                    list.add(s);
                }
            }
        }
        return list;
    }

    // Get students admitted within a date range (dates in format 'YYYY-MM-DD')
    public List<Student> getStudentsByDateRange(String startDate, String endDate) throws Exception {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM hostelstudents WHERE AdmissionDate BETWEEN ? AND ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Student s = new Student();
                    s.setStudentID(rs.getInt("StudentID"));
                    s.setStudentName(rs.getString("StudentName"));
                    s.setRoomNumber(rs.getString("RoomNumber"));
                    s.setAdmissionDate(rs.getString("AdmissionDate"));
                    s.setFeesPaid(rs.getDouble("FeesPaid"));
                    s.setPendingFees(rs.getDouble("PendingFees"));
                    list.add(s);
                }
            }
        }
        return list;
    }


}
