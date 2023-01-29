-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cf_id, backers_count
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC;




-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT campaign.cf_id, COUNT(*) as backers_count
FROM backers
JOIN campaign ON backers.cf_id = campaign.cf_id
WHERE campaign.outcome = 'live'
GROUP BY campaign.cf_id
ORDER BY backers_count DESC;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
CREATE TABLE "email_contacts_remaining_goal_amount" AS
SELECT contacts.first_name, contacts.last_name, contacts.email, (goal - pledged) as remaining_goal
FROM contacts
JOIN campaign ON contacts.contact_id = campaign.contact_id
WHERE campaign.outcome = 'live'
ORDER BY remaining_goal DESC;




-- Check the table
SELECT *
FROM email_contacts_remaining_goal_amount;


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
CREATE TABLE "email_backers_remaining_goal_amount" AS
SELECT backers.email, backers.first_name, backers.last_name, backers.cf_id, company_name, description, end_date, (goal - pledged) as left_of_goal
FROM backers
JOIN campaign ON backers.cf_id = campaign.cf_id
ORDER BY left_of_goal DESC;



-- Check the table

SELECT *
FROM email_backers_remaining_goal_amount;