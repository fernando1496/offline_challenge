
# Test Automation Project with Robot Framework, Selenium, and Allure

This project automates test cases using **Robot Framework**, **Selenium**, and integrates **Allure Reports** for enhanced reporting. It follows the Page Object Model (POM) design pattern.

## Prerequisites

- Python 3.x
- **Allure Command Line** (for generating and viewing test reports)
- **Selenium WebDriver** (Chrome or other browser drivers)
- **Robot Framework** and libraries

### Installing Allure Command Line

1. **macOS (with Homebrew)**:
    ```bash
    brew install allure
    ```

2. **Windows/Linux**:
   Download and install Allure from the official site: [Allure Installation](https://docs.qameta.io/allure/#_installing_a_commandline)

3. Verify installation:
    ```bash
    allure --version
    ```

---

## Setup Instructions

### Step 1: Create and Activate a Virtual Environment

1. Create a virtual environment:
   ```bash
   python -m venv venv
   ```

2. Activate the virtual environment:
   - On **Windows**:
     ```bash
     venv\Scripts\activate
     ```
   - On **macOS/Linux**:
     ```bash
     source venv/bin/activate
     ```

### Step 2: Install Dependencies

Install the required Python packages:
```bash
pip install -r requirements.txt
```

To generate the `requirements.txt`:
```bash
pip freeze > requirements.txt
```

---

## Running Tests

### Step 1: Run the Tests with Allure Listener

To run the tests and generate Allure results, use the following command:
```bash
robot --listener allure_robotframework --outputdir output/allure tests/test_homepage.robot
```

This will:
- Run the Robot Framework tests.
- Save Allure results in the `output/allure` folder.

To run the tests wihtout generating any report:
```bash
robot tests/test_homepage.robot 
```

### Step 2: View the Allure Report

After running the tests, generate and view the Allure report:
```bash
allure serve output/allure
```

This will open the Allure report in your default web browser.

---

## Test Case Documentation

The test performs the following steps:
1. **Open Homepage**: Opens the Telus TV Plus homepage.
2. **Close Pop-up**: Closes any pop-ups that appear.
3. **Click 'On Demand' Button**: Navigates to the 'On Demand' section.
4. **Scroll to Movies Section**: Scrolls down to reach the Movies section.
5. **Filter and Apply 'Animated'**: Filters movies by selecting the 'Animated' option.
6. **Find and Click Subtitle Containing 'E'**: Scrolls through the filtered movies and clicks the first subtitle containing 'E'.
7. **Verify Movie Rating**: Verifies that the movie rating contains 'E' before the first `|` character in the movie metadata.

---

## Folders and Structure

- **pages/**: Page Object Model (POM) classes, e.g., `homepage.robot`, `moviespage.robot`.
- **resources/**: Common resources and utilities, such as scrolling actions.
- **output/**: Contains Allure report results after running tests.
- **tests/**: Test case files, such as `test_homepage.robot`.

---

## Notes

- The Allure results are stored in `output/allure` by default.
- Ensure that the `chromedriver` or other browser drivers are correctly installed and configured in the `PATH`.
- Use the `allure serve` command after each test run to generate and view the report.
