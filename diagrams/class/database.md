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

    ASSIGNED_COURSES {
        int id
        int student_id
        int course_id
    }

    SCHOOL  ||--o{ USER : has
    COURSES }o--o{ ASSIGNED_COURSES : includes
    USER }o--o{ ASSIGNED_COURSES : "Enrolled in"
    SCHOOL ||--o{ COURSES : assignee
```
