package com.javapresso.dto;

import java.sql.Date;
import lombok.Data;

@Data
public class OrderDto {
  private int orderId;
  private Date orderDate;
  private String customerId;
  private String menuName;
  private String request;
  private boolean isIce;
  private boolean useCoupon;
}
