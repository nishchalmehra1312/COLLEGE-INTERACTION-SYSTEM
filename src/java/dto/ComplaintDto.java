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
public class ComplaintDto {
    int complaintId;
    String category , issuerId,description;
    String issuedToIdFaculty,issuedToIdHod,issuedToIdAdmin ,responder_id,response,replyDate;
    String personCategory;
    String issuedDate;

    public String getIssuedDate() {
        return issuedDate;
    }

    public void setIssuedDate(String issuedDate) {
        this.issuedDate = issuedDate;
    }

    public int getComplaintId() {
        return complaintId;
    }

    public void setComplaintId(int complaintId) {
        this.complaintId = complaintId;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getIssuerId() {
        return issuerId;
    }

    public void setIssuerId(String issuerId) {
        this.issuerId = issuerId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIssuedToIdFaculty() {
        return issuedToIdFaculty;
    }

    public void setIssuedToIdFaculty(String issuedToIdFaculty) {
        this.issuedToIdFaculty = issuedToIdFaculty;
    }

    public String getIssuedToIdHod() {
        return issuedToIdHod;
    }

    public void setIssuedToIdHod(String issuedToIdHod) {
        this.issuedToIdHod = issuedToIdHod;
    }

    public String getIssuedToIdAdmin() {
        return issuedToIdAdmin;
    }

    public void setIssuedToIdAdmin(String issuedToIdAdmin) {
        this.issuedToIdAdmin = issuedToIdAdmin;
    }

    public String getResponder_id() {
        return responder_id;
    }

    public void setResponder_id(String responder_id) {
        this.responder_id = responder_id;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    public String getReplyDate() {
        return replyDate;
    }

    public void setReplyDate(String replyDate) {
        this.replyDate = replyDate;
    }

    public String getPersonCategory() {
        return personCategory;
    }

    public void setPersonCategory(String personCategory) {
        this.personCategory = personCategory;
    }
    
}
