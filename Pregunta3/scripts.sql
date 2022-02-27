-- Todos los alumnos que llevan el curso X
Select c.Nombre, a.Nombre from alumno_curso as ac inner join curso as c 
on ac.idCurso = c.idCurso inner join alumno as a on ac.idAlumno = a.DNI where c.Nombre = 'Quimica';

-- Datos de los cursos dictados por mas de un profesor
SELECT c.Nombre,p.Nombre FROM curso as c inner join profesor as p on c.Profesor = p.idPofesor GROUP BY p.Nombre HAVING COUNT(*) > 1 ORDER BY p.Nombre;

-- Datos de los cursos alumnos que han llevado as de un curso
Select a.Nombre from alumno_curso as ac inner join curso as c 
on ac.idCurso = c.idCurso inner join alumno as a on ac.idAlumno = a.DNI GROUP BY a.Nombre HAVING COUNT(*) > 1 ORDER BY a.Nombre;

-- Datos de los alumnos que llevan el curso X y el curso Y
Select a.Nombre from alumno_curso as ac inner join curso as c 
on ac.idCurso = c.idCurso inner join alumno as a on ac.idAlumno = a.DNI where c.Nombre = 'Comunicacion' or c.Nombre = 'Matematica' 
group by a.nombre order BY a.Nombre;