# API For below task

Building upon this base project, implement a RoR based REST API Server to render a **General-Knowledge Quiz Question Bank**. The questions that would be asked in the Quiz are croud-sourced, i.e. general public will be allowed to submit questions and the corresponding answer. The entire question bank should be displayed upon request. Moderators should be allowed to assign category and difficulty level to each question. We should be able to list the questions by author name (or anonymous by giving the author name as 'anonymous').

## What needs to be done

 - Use an appropriate database to store the information as mentioned below:
    - Questions
        - actual question (text)
        - category of question (GEOGRAPHY, SCIENCE, POLITICS, LITERATURE, OTHERS)
        - difficulty level of question (EASY, MEDIUM, HARD)
        - answer to the question (text)
        - when was it submitted (timestamp)
    - Author of questions
        - type of author can be named or want to remain anonymous (NAMED, ANONYMOUS)
        - name of the author (text)
    - Link between author and the questions they submitted
    - moderator users
        - username of the moderator (text)
        - password of the moderator
        - name of the moderator (text)
    - Link between moderator and questions that they have moderated
 - We should be able to execute queries to get below data:
    - For general public:
        - List the entire Question Bank along with the author name, i.e. all the questions in the database. Answers should **not** be displayed.
    - For Moderators (simple HTTP Auth header may be used):
        - List the entire Question Bank along with the author name, i.e. all the questions in the database. Answers should also be displayed.
        - Add/update the category or difficulty level for a given question.
# rails_api
