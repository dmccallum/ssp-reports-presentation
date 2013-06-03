CREATE TABLE current_student_fact (
  student_id integer NOT NULL,
  coach_id integer NOT NULL,
  program_status_id integer NOT NULL
) WITH (
   OIDS=FALSE
 );
 ALTER TABLE current_student_fact
   OWNER TO sspadmin;
 GRANT ALL ON TABLE current_student_fact TO sspadmin;

ALTER TABLE current_student_fact ADD CONSTRAINT pk_current_student_fact PRIMARY KEY (student_id)

CREATE TABLE student (
  id integer NOT NULL,
  full_name character varying(100) NOT NULL,
  CONSTRAINT pk_student PRIMARY KEY (id)
) WITH (
   OIDS=FALSE
 );
 ALTER TABLE student
   OWNER TO sspadmin;
 GRANT ALL ON TABLE student TO sspadmin;

CREATE TABLE coach (
  id integer NOT NULL,
  full_name character varying(100) NOT NULL,
  CONSTRAINT pk_coach PRIMARY KEY (id)
) WITH (
   OIDS=FALSE
 );
 ALTER TABLE coach
   OWNER TO sspadmin;
 GRANT ALL ON TABLE coach TO sspadmin;

CREATE TABLE program_status (
  id integer NOT NULL,
  display_name character varying(80) NOT NULL,
  CONSTRAINT pk_program_status PRIMARY KEY (id)
) WITH (
   OIDS=FALSE
 );
 ALTER TABLE program_status
   OWNER TO sspadmin;
 GRANT ALL ON TABLE program_status TO sspadmin;

insert into program_status (id, display_name)
values (1,'Active');

insert into program_status (id, display_name)
values (2,'Inactive');

insert into program_status (id, display_name)
values (3,'Non-participating');

insert into program_status (id, display_name)
values (4,'Transitioned');

insert into program_status (id, display_name)
values (5,'No-Show');

insert into student (id, full_name)
values (1, 'Student 1');

insert into student (id, full_name)
values (2, 'Student 2');

insert into student (id, full_name)
values (3, 'Student 3');

insert into student (id, full_name)
values (4, 'Student 4');

insert into student (id, full_name)
values (5, 'Student 5');

insert into student (id, full_name)
values (6, 'Student 6');


insert into coach (id, full_name)
values (1, 'Coach 1');

insert into coach (id, full_name)
values (2, 'Coach 2');

insert into coach (id, full_name)
values (3, 'Coach 3');

insert into coach (id, full_name)
values (4, 'Coach 4');

insert into current_student_fact (student_id, coach_id, program_status_id)
values (1, 1, 1);

insert into current_student_fact (student_id, coach_id, program_status_id)
values (2, 1, 1);

insert into current_student_fact (student_id, coach_id, program_status_id)
values (3, 1, 2);

insert into current_student_fact (student_id, coach_id, program_status_id)
values (4, 2, 1);

insert into current_student_fact (student_id, coach_id, program_status_id)
values (5, 3, 3);

insert into current_student_fact (student_id, coach_id, program_status_id)
values (6, 4, 4);

select * from current_student_fact

alter current_student_fact add column total integer

-- Table: appointment

-- DROP TABLE appointment;

-- CREATE TABLE appointment
-- (
--   id uuid NOT NULL,
--   created_date timestamp without time zone NOT NULL,
--   modified_date timestamp without time zone NOT NULL,
--   created_by uuid NOT NULL,
--   modified_by uuid NOT NULL,
--   object_status integer NOT NULL,
--   person_id uuid NOT NULL,
--   start_time timestamp without time zone NOT NULL,
--   end_time timestamp without time zone NOT NULL,
--   attended boolean DEFAULT false,
--   CONSTRAINT pk_appointment PRIMARY KEY (id ),
--   CONSTRAINT appointment_created_by_person_id FOREIGN KEY (created_by)
--       REFERENCES person (id) MATCH SIMPLE
--       ON UPDATE NO ACTION ON DELETE NO ACTION,
--   CONSTRAINT appointment_modified_by_person_id FOREIGN KEY (modified_by)
--       REFERENCES person (id) MATCH SIMPLE
--       ON UPDATE NO ACTION ON DELETE NO ACTION,
--   CONSTRAINT appointment_person_id_person_id FOREIGN KEY (person_id)
--       REFERENCES person (id) MATCH SIMPLE
--       ON UPDATE NO ACTION ON DELETE NO ACTION
-- )
-- WITH (
--   OIDS=FALSE
-- );
-- ALTER TABLE appointment
--   OWNER TO sspadmin;
-- GRANT ALL ON TABLE appointment TO sspadmin;