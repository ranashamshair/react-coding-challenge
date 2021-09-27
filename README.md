# Senior Frontend Ruby on Rails Coding Challenge
As the next step in the interview process, we’d like you to complete a coding challenge.

## The Project
You will be building a basic Company and Information Resources Management (CIRM) Dashboard. There are two JSON files in this project, `companies.json`, and `naics.json`. Companies is a list of companies, like business structure, primary address, naics_code and other pertinent information about each company.

NAICS is a list of the North American Industry Classification System (NAICS) codes, with their code title, and description. The NAICS codes are a self selected classification that a company chooses as an industry identifier. These codes form a hierarchal structure depending on the level of detail in classifying the industry. See more here: https://www.census.gov/programs-surveys/economic-census/guidance/understanding-naics.html 

You will need to take the JSON data and persist it in a backend database. You will take the provided backend API, to be called upon by your frontend, which will display the data. This dashboard should allow registration and login of a user, requiring a password, and the user's credentials should also be persisted in your database.

The result should be a dashboard with two pages (the application can be single-page (SPA), and/or multiple pages):
* A registration and a login page
* A main page that displays company information with a few search filters and a tooltip overlay.

## The Requirements
### Backend
* Majority of the backend for this project is provided for you. This has been done with Ruby on Rails. Please check the `INSTALL.md` doc about getting this project setup on your local development instance.
* There are a few straightforward endpoints that is left as an exercise to be completed as part of this coding challenge.

### Frontend
* The frontend of this project can be done in React, Vue, or Angular. You are permitted to use any of these frameworks CLI generators to quickly start a project (npx create-react-app, ng new my-app, etc.)
* The application utilizes Bootstrap, Foundation, or Tailwind CSS framework. Bonus points for writing your own CSS styling.
* Login Page Requirements
  * Authentication is required to access the application
  * User must register for a new account, or login with an existing account, to proceed to the dashboard
* Main Page/Dashboard Requirements
  * The dashboard page cleanly displays the data from companies.json and can filter by a few select criteria.
  * The following should be displayed in the Companies table:
    * Display the total number of Companies.
    * For each Company, display Name, Primary Address, and Avatar Url,  Business Structure, NAICS code, Timestamp (created_at/updated_at).
    * Allow sorting on the name.
    * <strong>Bonus</strong>: When hovering over the NAICS code, a tooltip that provides the title and description of the code, it’s relative position in the hierarchal structure, as well as the root parent sector code, title and description if available.
  * The following should be used as filters:
    * Filter by company name
    * <strong>Bonus</strong>: Filter by NAICS Code. Any child elements of a NAICS code should be available for a parent code that’s used to filter.
    * <strong>Bonus</strong>: Filter by Business Structure
    * <strong>Bonus</strong>: Filter by City / State
  * <strong>Bonus</strong>: Provide a pagination UI control mechanism that lets a user page through company records with different page limit sizes. 

## Additional Information
* You are free to use any third-party libraries.
* Have fun and be as creative as you like!
* Completing the bonuses aren’t required to be considered for the position.
* Please feel free to reach out to ask any questions

## How To Submit This Challenge
* Clone this repository after getting access.
* Work on your solution
* <strong>Bonus</strong>: Deploy the frontend and backend of your application using free services (Netlify, Heroku, etc).
* Share a private repo with ryan-avamia.

## Timeframe
We would like the take home challenge to be completed within 3 days. If you need more time, please reach out to us. You will not be judged on how quickly you complete the challenge.
