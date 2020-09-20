package com.team.shoppingMall_119.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "form")
public class Form implements Serializable{
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "formId")
    private int formId;

    @Column(name = "userId")
    private int userId;

    @Column(name = "formPrice")
    private int formPrice;

    @Column(name = "formAddress")
    private String formAddress;
    
    @Column(name = "formNum")
    private int formNum;
    
    public int getFormNum() {
		return formNum;
	}

	public void setFormNum(int formNum) {
		this.formNum = formNum;
	}

	public String getFormDate() {
		return formDate;
	}

	public void setFormDate(String formDate) {
		this.formDate = formDate;
	}

	@Column(name = "formDate")
    private String formDate;

    // State有五种状态，分别由1-5表示：1 待审核，2 待发货，3 配送中，4 已签收， 5 确认订单完成
    @Column(name="formState")
    private Integer formState;

    public int getFormId() {
        return formId;
    }

    public void setFormId(int formId) {
        this.formId = formId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getFormPrice() {
        return formPrice;
    }

    public void setFormPrice(int formPrice) {
        this.formPrice = formPrice;
    }

    public String getFormAddress() {
        return formAddress;
    }

    public void setFormAddress(String formAddress) {
        this.formAddress = formAddress;
    }

    public Integer getFormState() {
        return formState;
    }

    public void setFormState(Integer formState) {
        this.formState = formState;
    }

}
