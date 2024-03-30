# ERD - Entity relationship Diagrams

The Entity-Relationship Diagram (ERD) for the "School Management" project provides a concise graphical overview of the database structure, showcasing the interactions between entities such as Students, Teachers, Courses, and Grades. It highlights key relationships and attributes essential for managing school administration data, serving as an essential tool for developers and administrators in maintaining and updating the database system. This ERD ensures a clear understanding of the data framework necessary for efficient educational institution management.

```mermaid
    erDiagram

    SCHOOL {
        int id
        string name
        string address
    }

    USER {
        int id
        string name
        string email
        string username
        string password_digest
        int school_id
        datetime created_at
        datetime updated_at
    }

    COURSES {
        int id
        string name
        string section
        int school_id
    }

    APPROVED_COURSES {
        int course_id
        int user_id
        double grade
    }

    ASSIGNED_COURSES {
        int id
        int student_id
        int course_id
    }

    TASKS {
        datetime expiration
        int course_id
    }

    TASK_DELIVERING {
        int user_id
        int course_id
        double score
        datetime delivering_date
    }


    COURSES }o--o{ ASSIGNED_COURSES : includes
    SCHOOL ||--o{ COURSES : assignee
    COURSES ||--o{ TASKS : "Created tasks"
    SCHOOL  ||--o{ USER : has
    APPROVED_COURSES }o--o{ USER: "depends"
    APPROVED_COURSES }o--o{ COURSES: "depends"
    TASK_DELIVERING }o--o{ TASKS: "depends"
    TASK_DELIVERING }o--o{ USER: ""
    USER }o--o{ ASSIGNED_COURSES : "Enrolled in"


```
