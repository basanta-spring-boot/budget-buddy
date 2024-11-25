@import com.javatechie.entity.Expense
@import java.util.List

@param Expense expense
@param List<Expense> expenses
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BudgetBuddy - Expense Tracker</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"> <!-- Font Awesome for icons -->
    <style>
        body {
            background-color: #f0f4f8; /* Light background */
            padding: 20px;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px; /* Reduced margin */
            font-family: 'Arial Black', sans-serif; /* More impactful font */
            font-size: 2rem; /* Reduced font size */
        }
        .container {
            max-width: 900px; /* Wider container */
            margin: 0 auto;
            background-color: #ffffff; /* White background for the container */
            padding: 30px; /* Padding around the content */
            border-radius: 15px; /* Rounded corners */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* Soft shadow */
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-custom {
            background-color: #28a745;
            color: white;
            transition: background-color 0.3s ease; /* Smooth transition */
        }
        .btn-custom:hover {
            background-color: #218838;
        }
        .table-container {
            background-color: #ffffff; /* White background for table container */
            padding: 20px; /* Padding around the table */
            border-radius: 10px; /* Rounded corners for the table */
            margin-top: 20px; /* Space above the table */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15); /* Shadow effect */
        }
        th {
            background-color: #007bff; /* Bootstrap primary color */
            color: white;
            text-align: center;
        }
        td {
            text-align: center;
            vertical-align: middle; /* Center align content vertically */
        }
        .actions a {
            margin: 0 5px;
            color: #fff; /* Icon color */
        }
        .actions .edit-icon {
            color: #ffc107; /* Yellow for edit icon */
        }
        .actions .delete-icon {
            color: #dc3545; /* Red for delete icon */
        }
        .modal-content {
            background-color: #f7f9fc; /* Light modal background */
        }
        footer {
            text-align: center;
            margin-top: 30px;
            color: #666;
        }
        .view-expenses-header {
            cursor: pointer;
            color: #007bff; /* Highlight color */
            font-size: 1.5rem; /* Increased font size */
            text-align: center;
            margin: 20px 0; /* Margin around the header */
            font-weight: bold; /* Bold text */
            transition: color 0.3s; /* Transition effect */
        }
        .view-expenses-header:hover {
            color: #0056b3; /* Darker shade on hover */
            text-decoration: underline; /* Underline on hover */
        }
        .eye-icon {
            margin-right: 10px; /* Space between icon and text */
        }
    </style>
</head>
<body>
<div class="container">
    <h1>BudgetBuddy</h1>

    <!-- Expense Form for Adding/Editing -->
    <form action="/save" method="post" class="bg-light p-4 border rounded shadow-sm">
        <input type="hidden" name="id" value="${expense.id}">

        <div class="form-group">
            <label for="description">Description</label>
            <input type="text" class="form-control" id="description" name="description" value="${expense.description}" required>
        </div>

        <div class="form-group">
            <label for="amount">Amount</label>
            <input type="number" class="form-control" id="amount" name="amount" step="0.01" value="${expense.amount}" required>
        </div>

        <div class="form-group">
            <label for="date">Date</label>
            <input type="date" class="form-control" id="date" name="date" value="${expense.date}" required>
        </div>

        <div class="form-group">
            <label for="category">Category</label>
            <input type="text" class="form-control" id="category" name="category" value="${expense.category}" required>
        </div>

        <button type="submit" class="btn btn-custom btn-block">${expense.id == null ? "Add Expense" : "Update Expense"}</button>
    </form>

    <!-- List of Expenses -->
    <h2 class="view-expenses-header" data-toggle="modal" data-target="#expenseModal">
        <i class="fas fa-eye eye-icon"></i> View Your Expenses
    </h2>

    <!-- Modal -->
    <div class="modal fade" id="expenseModal" tabindex="-1" aria-labelledby="expenseModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="expenseModalLabel">Your Expenses</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="table-container">
                        <table class="table table-striped table-hover">
                            <thead>
                            <tr>
                                <th>TxNo</th>
                                <th>Description</th>
                                <th>Amount</th>
                                <th>Date</th>
                                <th>Category</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            @for(Expense e : expenses)
                                <tr>
                                    <td>${e.id}</td>
                                    <td>${e.description}</td>
                                    <td>${e.amount}</td>
                                    <td>${e.date}</td>
                                    <td>${e.category}</td>
                                    <td class="actions">
                                        <a class="edit-icon" href="/edit/${e.id}" title="Edit">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a class="delete-icon" href="/delete/${e.id}" onclick="return confirm('Are you sure?')" title="Delete">
                                            <i class="fas fa-trash-alt"></i>
                                        </a>
                                    </td>
                                </tr>
                            @endfor
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 JavaTechie. All rights reserved.</p>
    </footer>
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
