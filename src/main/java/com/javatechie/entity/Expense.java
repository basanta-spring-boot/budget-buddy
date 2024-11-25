package com.javatechie.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Expense {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id; // Unique identifier for the expense
    public String description; // Description of the expense
    public double amount; // Amount spent
    public String date; // Date of the expense
    public String category; // Category of the expense (e.g., Food, Transport, etc.)
   // public String paymentMethod; // Payment method (e.g., Cash, Credit Card)
}