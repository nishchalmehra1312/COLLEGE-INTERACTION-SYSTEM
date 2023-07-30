/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author nishc
 */
public class AssignmentDto {
    
    int assignmentId;
    String assignmentIssue,description,date,assignedTo;
    String dueDate;
    int totalSubmissions;
    public String getDueDate() {
        return dueDate;
    }

    public int getTotalSubmissions() {
        return totalSubmissions;
    }

    public void setTotalSubmissions(int totalSubmissions) {
        this.totalSubmissions = totalSubmissions;
    }

    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }
    
    public String getAssignedTo() {
        return assignedTo;
    }

    public void setAssignedTo(String assignedTo) {
        this.assignedTo = assignedTo;
    }
    
    public int getAssignmentId() {
        return assignmentId;
    }

    public void setAssignmentId(int assignmentId) {
        this.assignmentId = assignmentId;
    }

    public String getAssignmentIssue() {
        return assignmentIssue;
    }

    public void setAssignmentIssue(String assignmentIssue) {
        this.assignmentIssue = assignmentIssue;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
        
}
