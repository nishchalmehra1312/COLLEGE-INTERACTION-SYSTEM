/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBConnector;
import dto.AssignmentDto;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nishc
 */
public class AssignmentDao {

    public  List<AssignmentDto>  getAssignmentsStudent(String id)
    {
        List<AssignmentDto> listStudent=new ArrayList<AssignmentDto>();
        String query="SELECT * from assignments WHERE assignedTo='"+id+"' UNION SELECT * FROM assignments WHERE assignedTo=1 ";
        Statement st =DBConnector.getStatement();
        try
        {
            ResultSet rs = null;
            rs=st.executeQuery(query);
            while(rs.next())
            {
                AssignmentDto assignment= new AssignmentDto();
                assignment.setAssignmentId(rs.getInt(1));
                assignment.setAssignmentIssue(rs.getString(2));
                assignment.setDescription(rs.getString(3));
                assignment.setDate(rs.getString(4));
                assignment.setDueDate(rs.getString(5));
                assignment.setAssignedTo(rs.getString(6));
                listStudent.add(assignment);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return listStudent;
    }
    public List<AssignmentDto> getAssignmentFacultyAssigned(String id)
    {
        List<AssignmentDto> listStudent=new ArrayList<AssignmentDto>();
        String query="SELECT * from assignments WHERE assignment_issuer='"+id+"' ";
        Statement st =DBConnector.getStatement();
        try
        {
            ResultSet rs = null;
            rs=st.executeQuery(query);
            while(rs.next())
            {
                AssignmentDto assignment= new AssignmentDto();
                assignment.setAssignmentId(rs.getInt(1));
                assignment.setAssignmentIssue(rs.getString(2));
                assignment.setDescription(rs.getString(3));
                assignment.setDate(rs.getString(4));
                assignment.setDueDate(rs.getString(5));
                assignment.setAssignedTo(rs.getString(6));
                listStudent.add(assignment);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return listStudent;
    }

  
    public  List<AssignmentDto> getAssignmentStudent(String id)
    {
           List<AssignmentDto> listStudent=new ArrayList<AssignmentDto>();
        String query="SELECT * from assignments WHERE assignedTo='"+id+"' UNION SELECT * from assignments WHERE assignedTo=1 ";
        Statement st =DBConnector.getStatement();
        try
        {
            ResultSet rs = null;
            rs=st.executeQuery(query);
            while(rs.next())
            {
                AssignmentDto assignment= new AssignmentDto();
                assignment.setAssignmentId(rs.getInt(1));
                assignment.setAssignmentIssue(rs.getString(2));
                assignment.setDescription(rs.getString(3));
                assignment.setDate(rs.getString(4));
                assignment.setDueDate(rs.getString(5));
                assignment.setAssignedTo(rs.getString(6));
                listStudent.add(assignment);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return listStudent;
    }
    
     public  List<AssignmentDto> getAssignmentStudentSubmit(int id)
    {
           List<AssignmentDto> listStudent=new ArrayList<AssignmentDto>();
        String query="SELECT * from assignments WHERE assignment_id='"+id+"'  ";
        Statement st =DBConnector.getStatement();
        try
        {
            ResultSet rs = null;
            rs=st.executeQuery(query);
            while(rs.next())
            {
                AssignmentDto assignment= new AssignmentDto();
                assignment.setAssignmentId(rs.getInt(1));
                assignment.setAssignmentIssue(rs.getString(2));
                assignment.setDescription(rs.getString(3));
                assignment.setDate(rs.getString(4));
                assignment.setDueDate(rs.getString(5));
                assignment.setAssignedTo(rs.getString(6));
                listStudent.add(assignment);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return listStudent;
    }
}
