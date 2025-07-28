package com.javapresso.dto;

import lombok.Data;

@Data
public class PointItemDto {
	public String customerId;
	public int stamp;
	public int coupon;
	public int expectedCoupon;
}
