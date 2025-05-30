package com.model;

public class Student {
    private int studentID;
    private String studentName;
    private String roomNumber;
    private String admissionDate;
    private double feesPaid;
    private double pendingFees;

    // Getters and Setters
    public int getStudentID() { return studentID; }
    public void setStudentID(int studentID) { this.studentID = studentID; }

    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }

    public String getRoomNumber() { return roomNumber; }
    public void setRoomNumber(String roomNumber) { this.roomNumber = roomNumber; }

    public String getAdmissionDate() { return admissionDate; }
    public void setAdmissionDate(String admissionDate) { this.admissionDate = admissionDate; }

    public double getFeesPaid() { return feesPaid; }
    public void setFeesPaid(double feesPaid) { this.feesPaid = feesPaid; }

    public double getPendingFees() { return pendingFees; }
    public void setPendingFees(double pendingFees) { this.pendingFees = pendingFees; }
}
