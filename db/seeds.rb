# Fake data to testing purposes

# Users instances 

administrator = Role.create(name: "Administrator")
client = Role.create(name: "Client")
visitor = Role.create(name: "Visitor")

10.times do
    admin = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123456", role: administrator)
    New.create(name: Faker::Book.title, content: Faker::Lorem.paragraph, image_url: Faker::Internet.url(host: 'example.com', path: '/image.url'), user: admin)
end

10.times do
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "client", role: client)
end

# Activities instances

apoyo_escolar_nivel_primario = Activity.create(
    name: "Apoyo escolar para el nivel primario",
    content: "El espacio de apoyo escolar es el corazón del área educativa. Se realizan los talleres de lunes a jueves de 10 a 12 horas y de 14 a 16 horas en el 
    contraturno, Los sábados también se realiza el taller para niños y niñas que asisten a la escuela doble turno. Tenemos un espacio especial para los de 1er 
    grado 2 veces por semana ya que ellos necesitan atención especial! Actualmente se encuentran inscriptos a este programa 150 niños y niñas de 6 a 15 años. 
    Este taller está pensado para ayudar a los alumnos con el material que traen de la escuela, también tenemos una docente que les da clases de lengua y matemática 
    con una planificación propia que armamos en Manos para nivelar a los niños y que vayan con más herramientas a la escuela.",
    image: "Image"
)

apoyo_escolar_nivel_secundario = Activity.create(
    name: "Apoyo escolar para el nivel secundario",
    content: "Del mismo modo que en primaria, este taller es el corazón del área secundaria. Se realizan talleres de lunes a viernes de 10 a 12 horas y de 16 a 18 
    horas en el contraturno. Actualmente se encuentran inscriptos en el taller 50 adolescentes entre 13 y 20 años. Aquí los jóvenes se presentan con el material que 
    traen del colegio y una docente de la institución y un grupo de voluntarios los recibe para ayudarlos a estudiar o hacer la tarea. Este espacio también es utilizado 
    por los jóvenes como un punto de encuentro y relación entre ellos y la institución.",
    image: "Image"
)

tutorias = Activity.create(
    name: "Tutorías",
    content: "Es un programa destinado a jóvenes a partir del tercer año de secundaria, cuyo objetivo es garantizar su permanencia en la escuela y construir un 
    proyecto de vida que da sentido al colegio. El objetivo de esta propuesta es lograr la integración escolar de niños y jóvenes del barrio promoviendo el soporte 
    socioeducativo y emocional apropiado, desarrollando los recursos institucionales necesarios a través de la articulación de nuestras intervenciones con las escuelas 
    que los alojan, con las familias de los alumnos y con las instancias municipales, provinciales y nacionales que correspondan. El programa contempla: 

    - Encuentro semanal con tutores (Individuales y grupales)
    - Actividad proyecto (Los participantes del programa deben pensar una actividad relacionada a lo que quieren hacer una vez terminada la escuela y su tutor 
        los acompaña en el proceso)
    - Ayudantías (Los que comienzan el 2do años del programa deben elegir una de las actividades que se realizan en la institución para acompañarla e ir conociendo 
        como es el mundo laboral que les espera).
    - Acompañamiento escolar y familiar (Los tutores son encargados de articular con la familia y con las escuelas de los jóvenes para monitorear el estado de los tutoreados)
    - Beca estímulo (los jóvenes reciben una beca estímulo que es supervisada por los tutores). Actualmente se encuentran inscriptos en el programa 30 adolescentes.",
    image: "Image"
)   

taller_arte_y_cuentos = Activity.create(
    name: "Taller de arte y cuentos",
    content: "Taller literario y de manualidades que se realiza semanalmente.",
    image: "Image"
)    

paseos_recreativos_y_educativos = Activity.create(
    name: "Paseos recreativos y educativos",
    content: "Estos paseos están pensados para promover la participación y sentido de pertenencia de los niños, niñas y adolescentes al área educativa.",
    image: "Image"
)

# Categories Instances

CATEGORIES = %w{ Educacion Ocio Novedades Cultura Noticias Tecnologia }


CATEGORIES.each do |category|

    Category.create!(

        name: category,

        description: 'description',        

    )

end

# Members instance

10.times do
    Member.create(name: Faker::Name.name, facebook_url: Faker::Internet.url(host: "facebook.com"), instagram_url: Faker::Internet.url(host: "instagram.com"), linkedin_url: Faker::Internet.url(host: "linkedin.com"), description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", image_url: Faker::Internet.url(host: "example.com", path: "/image.jpg"))
end

# News instances

admin = User.create(first_name: "Admin", last_name: "Admin", email: "admin@admin.com", password: "password", role: administrator)

10.times do
    New.create(name: Faker::Book.title, content: Faker::Lorem.paragraph, image_url: Faker::Internet.url(host: 'example.com', path: '/image.url'), user: admin)
end

# Commentary instances

usuario = User.create(first_name: "User", last_name: "User", email: "user@user.com", password: "password", role: client)

10.times do
    Commentary.create(body: Faker::Lorem.paragraph, user: usuario)
end

p "#{User.count} created users"
p "#{Role.count} created roles"
p "#{New.count} created news"
p "#{Commentary.count} created comments"
p "#{Category.count} created categories"