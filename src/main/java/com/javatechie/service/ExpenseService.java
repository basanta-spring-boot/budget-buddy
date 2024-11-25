package com.javatechie.service;

import com.javatechie.entity.Expense;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Random;

@Service
public class ExpenseService {

    // In-memory storage for Expense objects
    private final List<Expense> expenses = new ArrayList<>();

    // Get all expenses
    public List<Expense> getAllExpenses() {
        return new ArrayList<>(expenses); // Return a copy to avoid modification of internal list
    }

    // Save an expense
    public Expense saveExpense(Expense expense) {
        if (expense.getId() == null) {
            expense.setId(new Random().nextLong());
        }
        // Check if the expense already exists and update it, otherwise add it
        expenses.removeIf(e -> e.getId().equals(expense.getId()));
        expenses.add(expense);
        return expense;
    }

    // Delete an expense by ID
    public void deleteExpense(Long id) {
        expenses.removeIf(expense -> expense.getId().equals(id));
    }

    // Get an expense by ID
    public Expense getExpenseById(Long id) {
        Optional<Expense> expense = expenses.stream()
                .filter(e -> e.getId().equals(id))
                .findFirst();
        return expense.orElse(null);
    }
}
