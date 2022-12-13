-- 1)
SELECT * FROM pais;

-- 2)
SELECT nombre FROM provincia LIMIT 10;

--3)
SELECT * FROM provincia WHERE idpais=2;

--4)
SELECT * FROM provincia WHERE nombre LIKE '%jua%';

--5)
SELECT * FROM provincia WHERE id BETWEEN 5 AND 8; 
SELECT * FROM provincia WHERE id IN (5, 6, 7, 8);

--6)
SELECT nombre FROM provincia WHERE id BETWEEN 1 AND 4;
SELECT nombre FROM provincia WHERE id IN (1, 2, 3, 4);

--7)
SELECT * FROM pais 
    INNER JOIN provincia ON pais.id = provincia.idpais
    WHERE pais.nombre = 'Argentina';

SELECT * FROM pais 
    INNER JOIN provincia ON pais.id = provincia.idpais
    WHERE pais.id LIKE 1;

--8)
SELECT pais.nombre as Pais, provincia.nombre as Provincia FROM pais
    INNER JOIN provincia ON pais.id = provincia.idpais
    WHERE pais.nombre = 'Argentina';

--9)
SELECT pais.nombre as Pais, provincia.nombre as Provincia, departamento.nombre as Departamento FROM PAIS
    INNER JOIN provincia ON pais.id = provincia.idpais
    INNER JOIN departamento ON provincia.id = departamento.idprovincia
    WHERE provincia.nombre = 'Buenos Aires' LIMIT 20;

--10)
SELECT pais.nombre as Pais, provincia.nombre as Provincia, departamento.nombre as Departamento, superficie.valor as Superficie FROM PAIS
    INNER JOIN provincia ON pais.id = provincia.idpais
    INNER JOIN departamento ON provincia.id = departamento.idprovincia
    INNER JOIN superficie ON departamento.id = superficie.idDepartamento
    WHERE provincia.nombre = 'Buenos Aires' LIMIT 20;

--11)
SELECT working_days.day, work_shifts.work_shift FROM users
    INNER JOIN doctors ON users.id = doctors.id_user
    INNER JOIN working_days ON doctors.id = working_days.id_doctor
    INNER JOIN work_shifts ON work_shifts.id = working_days.id_work_shift
    WHERE users.id LIKE 1;


-- SELECT users.id AS id_user, doctors.id AS id_doctor, working_days.*, work_shifts.* FROM users
--     INNER JOIN doctors ON users.id = doctors.id_user
--     INNER JOIN working_days ON doctors.id = working_days.id_doctor
--     INNER JOIN work_shifts ON work_shifts.id = working_days.id_work_shift
--     WHERE users.id LIKE 1;


