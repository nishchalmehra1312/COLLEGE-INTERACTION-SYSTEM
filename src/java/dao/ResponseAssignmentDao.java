/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBConnector;
import dto.AssignmentResponseDto;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nishc
 */
public class ResponseAssignmentDao {
    
    public  List<AssignmentResponseDto> getAllResponses(int id)
    {
        List<AssignmentResponseDto> responses = new ArrayList<AssignmentResponseDto>();
        Statement st=DBConnector.getStatement();
        ResultSet rs=null;
        String query="SELECT * FROM assignmentresponses WHERE assignmentId='"+id+"'";
        try
        {
            rs=st.executeQuery(query);
            while(rs.next())
            {
                AssignmentResponseDto response=new AssignmentResponseDto();
                response.setSubmissionId(rs.getInt(1));
                response.setStudentId(rs.getString(2));
                response.setDesccription(rs.getString(3));
                response.setSubmissionDate(rs.getString(4));
                response.setAssignmentId(rs.getInt(5));
                responses.add(response);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return responses;
    }
    
    public  List<AssignmentResponseDto> getAllResponsesStudent(String stuId , int id )
    {
        List<AssignmentResponseDto> responses = new ArrayList<AssignmentResponseDto>();
        Statement st=DBConnector.getStatement();
        ResultSet rs=null;
        String query="SELECT * FROM assignmentresponses WHERE assignmentId='"+id+"' AND studentId='"+stuId+"' ";
        try
        {
            rs=st.executeQuery(query);
            while(rs.next())
            {
                AssignmentResponseDto response=new AssignmentResponseDto();
                response.setSubmissionId(rs.getInt(1));
                response.setStudentId(rs.getString(2));
                response.setDesccription(rs.getString(3));
                response.setSubmissionDate(rs.getString(4));
                response.setAssignmentId(rs.getInt(5));
                responses.add(response);
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        return responses;
    }
    
}
