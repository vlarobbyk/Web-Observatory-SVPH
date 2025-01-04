#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(ggplot2)
library(ggalluvial)
library(httr)
library(stringr)
library(jsonlite)
library(ggthemes)
library(dplyr)


#install.packages("shinythemes")
#install.packages("shinydashboard")
#library(shinythemes)
library(bs4Dash)
#library(shinydashboard)


# ICONOS Página:
# https://www.w3schools.com/icons/fontawesome5_icons_education.asp




ui <- dashboardPage(
  dashboardHeader(title = 'SVP-WObservatory'),
  dashboardSidebar(
    sidebarMenu(
        menuItem('Introduction', tabName = 'introduction', icon = icon('fas fa-book-open')),
        menuItem('SVP Knowledge level | Children', tabName = 'svpk_children', icon = icon('fab fa-accessible-icon')),
        menuItem('SVP Knowledge level | Teachers', tabName = 'svpk_teachers', icon = icon('fas fa-chalkboard-teacher'))
    )
  ),
  
  
  bs4DashBody(
      tags$head(
        tags$style(HTML("
          /* Enable text wrapping for sidebar menu items */
          .main-sidebar .nav-sidebar .nav-link {
            white-space: normal !important; /* Allow text to wrap */
            word-wrap: break-word !important; /* Break long words if necessary */
            overflow-wrap: break-word !important; /* Ensure wrapping on overflow */
            line-height: 1.2 !important; /* Adjust line spacing */
            padding: 8px 10px !important; /* Add some padding for better appearance */
          }
          
          /* Optional: Adjust icon alignment if text wraps */
          .main-sidebar .nav-sidebar .nav-link .nav-icon {
            vertical-align: top !important;
          }
        "))
      ),
    
    
      
      bs4TabItems(
        bs4TabItem(
          tabName = 'introduction',
          fluidRow(
            box(
              title = "Introduction",
              width = 12,
              height = "100%",
              HTML("
                
                <p><strong>Sexual Health (SH)</strong> constitutes a <strong>fundamental human right</strong> and an essential dimension for the <strong>comprehensive well-being</strong> of individuals, requiring priority attention. However, so far, there are no educational tools specifically adapted for people with <strong>disabilities</strong> to access content focused on the <strong>prevention of sexual violence</strong>. This population is particularly <strong>vulnerable</strong>, with alarming statistics indicating that approximately <strong>53% of people with intellectual disabilities</strong> have been victims of sexual abuse at some point in their lives, with a probability up to <strong>ten times higher</strong> compared to those without this condition (Romero et al., 2022; cited from Reiter et al., 2007). Furthermore, individuals with <strong>multiple disabilities</strong> face an even higher risk of suffering this type of violence (Romero et al., 2022; cited from Kvam, 2004).</p>

                <p>This problem is exacerbated by a <strong>cultural factor</strong> that perceives sexual health as a <em>taboo</em>, making it even more challenging to recognize the need for people with disabilities to <strong>access and fully exercise their Sexual and Reproductive Rights (SRR)</strong>, with a special emphasis on <strong>self-care</strong>. Adding to this situation, traditional <strong>sexual education</strong> follows a <em>vertical and repressive approach</em>, where controlling impulses is prioritized over fostering effective understanding. Moreover, this approach tends to be <em>theoretical</em>, lacking practical applications in daily life, and excludes active participation in <strong>decision-making</strong> (Guerrero & Lafaurie, 2023; cited from Gil-Llario, 2017). This framework is reinforced by a <strong>prejudice of infantilization</strong>, which severely limits the ability of people with disabilities to <strong>exercise their sexual and reproductive rights</strong>.</p>
                
                <p>A potential solution to improve access to educational content on <strong>sexual health with a preventive approach</strong> is the use of <strong>Information and Communication Technologies (ICTs)</strong>, which emerge as an effective tool to <strong>reduce the historical exclusion</strong> affecting this population. These technologies may include <strong>visual, mental, and cognitive resources</strong>, among others, which have the potential to facilitate <strong>learning processes</strong> as long as they are <strong>adapted to the specific needs</strong> of each individual (Hoyos, 2023; cited from Aparicio, 2018). <strong>ICTs</strong> can be defined as electronic tools that allow for the <strong>creation, storage, retrieval, and transmission of information</strong> efficiently, integrating multiple codes in a <em>hypermedia</em> environment, and are mainly classified into three areas: <strong>computing, video, and telecommunications</strong>, with constant interrelation among them (Rodríguez, 2015; cited from Cabero, 2010).</p>
                
                <p>Among the most notable resources within <strong>ICTs</strong> are the <strong>Virtual Learning Objects (VLOs)</strong>, which are technological and pedagogical tools designed to <strong>facilitate access to educational content</strong> through characteristics such as <strong>interaction, accessibility, usability, and timelessness</strong> (Urrutia & Sevilla, cited from López, Nelson & Franco, 2005). <strong>VLOs</strong> have proven effective in <strong>improving learning outcomes</strong> in various areas, including <strong>sexual health, self-care, mathematics, robotics, and languages</strong> (Haruna et al., 2023). In fact, studies have shown that VLOs can <strong>increase the performance of students with multiple disabilities by up to 86.66%</strong> (Sevilla et al., 2021).</p>
                
                <p>Consequently, this proposal aims to <strong>determine the level of knowledge about sexual and reproductive health (SRH) and self-care in people with disabilities through the use of VLOs</strong>, which can also facilitate <strong>access to adapted educational content</strong> in the aforementioned areas.</p>

                <p>In light of the above, this article presents a proposal for a <strong>Virtual Learning Object (VLO)</strong> designed to support the teaching of <strong>Sexual Violence Prevention (SVP) and Health Self-Care</strong> in children with various types of disabilities. Likewise, the study outlines the foundational structure of a <strong>web observatory</strong>, aimed at deploying dynamic websites capable of generating statistical graphs to facilitate research processes. These insights are intended to improve <strong>decision-making</strong> in the educational field of SVP.</p>
                
                <p>To understand the <strong>perception</strong> of both children with disabilities and their teachers, an <strong>exploratory study</strong> was conducted with <strong>25 children</strong> attending <strong>three special education centers</strong> in the city of <strong>Cuenca</strong>. Similarly, the study assessed the <strong>perceptions of 42 teachers</strong> from these same centers regarding the <strong>teaching of SVP</strong> to their students.</p>                
                
                <br />
                
                <h5> References: </h5>
                
                <ul style=\"font-family: Arial, sans-serif; line-height: 1.6;\">
                
                  <li>
                    <strong>Romero-Martín, S., Esteban-Carbonell, E., De Pedro-Herrera, D., & Boira-Sarto, S.</strong> (2022). 
                    Violencia a personas con discapacidad intelectual. 
                    <em>Revista Española de Discapacidad</em>, <strong>10</strong>(1), 93-114. 
                    <a href=\"https://doi.org/10.5569/2340-5104.10.1.05\" target=\"_blank\">https://doi.org/10.5569/2340-5104.10.1.05</a>
                  </li>
                  
                  <li>
                    <strong>Guerrero-Celis, S., & Lafaurie-Villamil, M. M.</strong> (2023). 
                    Discapacidad intelectual y derechos sexuales: revisión narrativa de la literatura. 
                    <em>Revista Investigación en Salud Universidad de Boyacá</em>, <strong>10</strong>(1), 129-144. 
                    <a href=\"https://doi.org/10.24188/redui.v10i1.2412\" target=\"_blank\">https://doi.org/10.24188/redui.v10i1.2412</a>
                  </li>
                  
                  <li>
                    <strong>Hoyos, L.</strong> (2023). 
                    Educación sexual y reproductiva en estudiantes con discapacidad intelectual de la IE San Isidoro del Municipio de El Espinal-Tolima, mediante la aplicación del software \"Edusex\". 
                    <em>Revista Boletín Redipe</em>, <strong>12</strong>(8), 175-195.
                    <a href=\"https://doi.org/10.36260/rbr.v12i8.3012\" target=\"_blank\">https://doi.org/10.36260/rbr.v12i8.3012</a>
                  </li>
                  
                  <li>
                    <strong>Rodríguez, C.</strong> (2015). 
                    Uso de las TIC para favorecer el proceso de aprendizaje de estudiantes con Discapacidad Intelectual en la Institución Educativa Nicolás Gómez Dávila, Bogotá, Colombia. 
                    <em>Estudio de caso.</em>
                  </li>
                  
                  <li>
                    <strong>Urrutia, P., & Sevilla, A.</strong> (2013). 
                    Objetos de aprendizaje en la educación. 
                    <em>Investigación y Desarrollo</em>, <strong>6</strong>(1), 33-41.
                  </li>
                  
                  <li>
                    <strong>Haruna, H., Zainuddin, Z., Okoye, K., Mellecker, R. R., Hu, X., Chu, S. K. W., & Hosseini, S.</strong> (2023). 
                    Mejorar la instrucción y la alfabetización en salud sexual con juegos serios e intervenciones de gamificación: una perspectiva de los resultados de aprendizaje de los estudiantes y las diferencias de género. 
                    <em>Interactive Learning Environments</em>, <strong>31</strong>(4), 2392-2410. 
                    <a href=\"https://doi.org/10.1080/10494820.2023.2039441\" target=\"_blank\">https://doi.org/10.1080/10494820.2023.2039441</a>
                  </li>
                  
                  <li>
                    <strong>Sevilla, M., Quitiaquez, W., Toapanta, E., & Quitiaquez, R.</strong> (2021). 
                    Objeto virtual de aprendizaje, un instrumento de apoyo en la educación para niños con discapacidad. 
                    <em>Uniandes Episteme</em>, <strong>8</strong>(4), 537-551. 
                    <a href=\"https://doi.org/10.18272/ue.v8i4.2512\" target=\"_blank\">https://doi.org/10.18272/ue.v8i4.2512</a>
                  </li>
                  
                </ul>                

              ")
            )
          )
          
        ),
        
        bs4TabItem(
          tabName = 'svpk_children',
            fluidRow(
              column(
                width = 4, 
                selectInput(
                  inputId = 'knowledge_about',
                  label = 'Knowledge about the human body:',
                  choices = c('Select a variable' = 'select', 'Female body' = 'Knowledge_awoman', 'Male body' = 'Knowledge_aman'),
                  selected = 'select'
                )
              ),
              
              column(
                width = 4,
                selectInput(
                  inputId = 'mcknowledge_about',
                  label = 'Knowledge about masturbation and contraceptive methods:',
                  choices = c('Select a variable' = 'select', 'What masturbation is' = 'Masturbation','What contraceptive methods are' = 'Contraceptive'),
                  selected = 'select'
                )
              ),
              
              box(
                plotOutput('plot1', height = 600), 
                uiOutput('dynamic_paragraph_1'),
                width = 12
              ),
              
              #box(
              #  title = 'Controls',
              #  sliderInput('slider', 'Number of observations: ', 1, 100, 50)
              #)
            )
        ),
        
        bs4TabItem(
          tabName = 'svpk_teachers',
          fluidRow(
            column(
              width = 4, 
              selectInput(
                inputId = 'knowledge_aboutsvp',
                label = 'Knowledge/Addressing Sexual Violence Prevention and Selfcare (SVP):',
                choices = c('Select a variable' = 'select', 'Knowledge about SVP' = 'Knowledge_asvp', 'Address SVP with Children' = 'Address_svp', 'Teaching SVP to ChWD in the Classroom' = 'Teaching_svp'),
                selected = 'select'
              )
            ),
            
            
            box(
              plotOutput('plot2', height = 600), 
              uiOutput('dynamic_paragraph_2'),
              width = 12
            ),
            
          )
        )
      )
    )
  
)

server <- function(input, output, session){
  #set.seed(337)
  #histdata <- rnorm(500)
  PATH_YOUTH <- './data/Children-Responses.csv'
  PATH_TEACHERS <- './data/Teachers-Responses.csv'
  
  
  icd_token <- function(client_id = NULL, client_secret = NULL) {
    
    if (is.null(client_id)) client_id <- readline("Enter client id: ")
    if (is.null(client_secret)) client_secret <- readline("Enter client secret: ")
    
    httr::init_oauth2.0(
      endpoint = httr::oauth_endpoint(
        authorize = NULL,
        access = "https://icdaccessmanagement.who.int/connect/token"
      ),
      app = httr::oauth_app(
        appname = "icd",
        key = client_id,
        secret = client_secret
      ),
      scope = "icdapi_access",
      client_credentials = TRUE
    )
  }
  
  
  token_as_header <- function(token) {
    httr::add_headers(
      Authorization = paste(token$token_type, token$access_token),
      Accept = "application/ld+json",
      "Accept-Language" = "en",
      "API-Version" = "v2"
    )
  }
  
  client_id <- '32231c30-ee95-4a14-b739-09a1eaaf00e2_4c454a64-3493-47fc-b49e-f3e7468dc168'
  client_secret <- 'jY2e1J9062bE/6grkAfgmdmB0jCT2mfdTVNHo411u0A='
  
  # WHO API Account:
  # Client id: 32231c30-ee95-4a14-b739-09a1eaaf00e2_4c454a64-3493-47fc-b49e-f3e7468dc168
  # Client secret: jY2e1J9062bE/6grkAfgmdmB0jCT2mfdTVNHo411u0A=
  token <- icd_token(client_id, client_secret)
  
  
  df_youth <- read.csv(PATH_YOUTH, sep = ';', header = TRUE)
  df_youth <- df_youth %>%
    filter(!row_number()==26)
  
  
  icd_10_codes <- str_extract_all(df_youth$Indicar.si.el.la.estudiante.tiene.discapacidad, 
                                  '[\\(]([A-Z]+[0-9]+)([(\\.)][0-9]+)?[\\)]')
  
  icd_10_codes_v <- c()
  icd_10_names_v <- c()
  tmp <- c()
  
  for (i in 1:length(icd_10_codes)){
    tmp <- strsplit(icd_10_codes[[i]], split = ' ')
    if (length(tmp)==1){
      icd_10_codes_v <- append(icd_10_codes_v, icd_10_codes[[i]])
    }else if(length(tmp)==2){
      icd_10_codes_v <- append(icd_10_codes_v, tmp[1])
    }
  }
  icd_10_codes_v <- str_replace(str_replace(icd_10_codes_v, '\\(',''),'\\)','')

  for (i in 1:length(icd_10_codes_v)){
    result <- GET(
      url = paste("https://id.who.int/icd/release/10/",icd_10_codes_v[[i]],sep=''),
      token_as_header(token)
    )
    values <- fromJSON(content(result, as = "text", encoding = "UTF-8"))

    icd_10_names_v <- append(icd_10_names_v, values$title[[2]])
  }
  
  ############################################3
  # Children responses dataframe
  ############################################3
  
  vector_know_enw <- c('Knows all parts of the body', 'Doesn\'t know where the vagina is', 'Doesn\'t know where the belly button is', 'Doesn\'t know where the breasts and vagina are', 'Doesn\'t know where the breasts and vagina are')
  vector_know_esw <- c('Conoce todas las partes del cuerpo ', 'Desconoce donde queda la vagina', 'Desconoce donde queda el ombligo', 'Desconoce donde queda senos y vagina', 'Desconoce donde estan los senos y vagina')
  
  vector_know_enm <- c('Knows all the parts of the body',
                       'Does not know where the testicles are',
                       'Does not know where the chest, stomach, navel, legs, and feet are',
                       'Does not know where the belly is',
                       'Does not know where the penis and testicles are')
  vector_know_esm <- c('Conoce todas las partes del cuerpo','Desconoce donde quedan los testículos','Desconoce donde queda el pecho, estomago,ombligo, piernas,pies','Desconoce donde queda la barriga', 'Desconoce donde quedan pene y testículos')
  
  
  df_youth_alluvial <- data.frame(
    Gender = df_youth$Género,
    Age = as.numeric(str_replace(df_youth$Indique.su.edad, 'años','')),
    Disability = icd_10_names_v,
    ICD_10_codes = icd_10_codes_v,
    Knowledge_awoman = plyr::mapvalues(df_youth$X5..La.siguiente.es.una.foto.del.cuerpo.de.una.mujer..Por.favor.señale.con.el.dedo.en.el.dibujo.todas.las.partes.del.cuerpo.que.cree.conocer,
                                       from=vector_know_esw, to=vector_know_enw),
    Knowledge_aman = plyr::mapvalues(df_youth$X4..La.siguiente.es.una.foto.del.cuerpo.de.un.hombre..Por.favor.señale.con.el.dedo.en.el.dibujo.todas.las.partes.del.cuerpo.que.cree.conocer,
                                     from=vector_know_esm, to=vector_know_enm),
    Institution = df_youth$Institución.a.la.que.pertecece,
    Sexual_Ed = ifelse(df_youth$X1...Alguna.vez.ha.recibido.educación.sexual.en.su.colegio.=='SI ','YES','NO'),
    Masturbation = ifelse(df_youth$X7...Cree.saber.lo.que.es.la.masturbación.=='SI', 'YES', 'NO'),
    Menstruation = ifelse(df_youth$X11...Usted.sabe.lo.que.es.la.mestruación.=='SI','YES', 'NO'),
    Contraceptive = ifelse(df_youth$X10..Indique.qué.anticonceptivos.o.metodos.para.prevenir.el.embarazo.conoce.usted=='No conoce', 'NO', 'YES')
  )
  
  dataf <- reactive({
    df_youth_alluvial
  })

  
  ############################################3
  # Teachers responses dataframe
  ############################################3
  
  df_teachers <- read.csv(PATH_TEACHERS, sep=';', header = TRUE)
  df_teachers$Indique.sus.años.de.experiencia.profesional <- str_extract(df_teachers$Indique.sus.años.de.experiencia.profesional, 
                                                                         '([0-9])+')
  
  df_teachers$Indique.sus.años.de.experiencia.profesional <- as.numeric(unlist(df_teachers$Indique.sus.años.de.experiencia.profesional))
  df_teachers$Indique.sus.años.de.experiencia.porfesional.durante.el.trabajo.con.niños.niñas.y.adolecentes.con.discapacidad <- 
    str_extract(df_teachers$Indique.sus.años.de.experiencia.porfesional.durante.el.trabajo.con.niños.niñas.y.adolecentes.con.discapacidad, '([0-9])+')
  
  df_teachers$Indique.sus.años.de.experiencia.porfesional.durante.el.trabajo.con.niños.niñas.y.adolecentes.con.discapacidad <- as.numeric(
    unlist(df_teachers$Indique.sus.años.de.experiencia.porfesional.durante.el.trabajo.con.niños.niñas.y.adolecentes.con.discapacidad)
  )
  df_teachers$Indique.sus.años.de.experiencia.porfesional.durante.el.trabajo.con.niños.niñas.y.adolecentes.con.discapacidad[is.na(df_teachers$Indique.sus.años.de.experiencia.porfesional.durante.el.trabajo.con.niños.niñas.y.adolecentes.con.discapacidad)] <- 0
  
  
  knowledge_prevention_es <- c('Fácil','Un poco difícil','Muy fácil','Difícil')
  knowledge_prevention_en <- c('Easy','A little difficult','Very easy','Difficult')
  know_about_sp_es <- c('Lo necesario','Mucho', 'Muy poco')
  know_about_sp_en <- c('Just enough','A lot','Very little')
  
  df_teachers$X5...Usted.aborda.temas.de.violencia.sexual.y.autocuidado.de.la.salud.con.sus.alumnos. <- str_replace(df_teachers$X5...Usted.aborda.temas.de.violencia.sexual.y.autocuidado.de.la.salud.con.sus.alumnos.,
                                                                                                                    ' ','')
  df_teachers$X1..Qué.tanto.conoce.usted.acerca.de.la.prevencion.de.violencia.sexual.y.el.autocuidado.de.la.salud. <- trimws(df_teachers$X1..Qué.tanto.conoce.usted.acerca.de.la.prevencion.de.violencia.sexual.y.el.autocuidado.de.la.salud.,
                                                                                                                             which = 'right')
  
  df_teachers_alluvial <- data.frame(
    Gender = plyr::mapvalues(df_teachers$Indique.su.género.,from = c('Femenino', 'Masculino','Masculino '), to = c('F','M','M')) ,
    Years_experience = df_teachers$Indique.sus.años.de.experiencia.profesional,
    Years_experience_disability = df_teachers$Indique.sus.años.de.experiencia.porfesional.durante.el.trabajo.con.niños.niñas.y.adolecentes.con.discapacidad,
    Prevention_in_disability = plyr::mapvalues(df_teachers$X3..Qué.tan.fácil.cree.que.le.resulta.el.manejo.del.tema.de.la.prevención.de.violencia.sexual.en.jóvenes.con.discapacidad.,
                                               from=knowledge_prevention_es, to=knowledge_prevention_en),
    Teach_violence_prev = ifelse(df_teachers$X5...Usted.aborda.temas.de.violencia.sexual.y.autocuidado.de.la.salud.con.sus.alumnos.=='Si', 'YES', 'NO'),
    Knows_about = plyr::mapvalues(df_teachers$X1..Qué.tanto.conoce.usted.acerca.de.la.prevencion.de.violencia.sexual.y.el.autocuidado.de.la.salud.,
                                  from=know_about_sp_es, to=know_about_sp_en),
    Training = plyr::mapvalues(df_teachers$X2..Usted.ha.recibido.capacitaciones.acerca.de.los.temas.antes.mencionados.,
                               from=c('Si','Si ','No','No '), to =c('YES','YES','NO','NO'))
  )
  
  df_teachers_alluvial$Experience_Range <- cut(df_teachers_alluvial$Years_experience,
                                               breaks = c(-Inf, 0, 5, 10, 15, 20, Inf),
                                               labels = c('0','1 to 5','6 to 10','11 to 15', '16 to 20','>20'),
                                               right = TRUE)
  
  df_teachers_alluvial$ExperienceChWD_Range <- cut(df_teachers_alluvial$Years_experience_disability,
                                                   breaks = c(-Inf,0, 5, 10, 15, 20, Inf),
                                                   labels = c('0','1 to 5','6 to 10','11 to 15', '16 to 20','>20'),
                                                   right = TRUE)
  
  dataft <- reactive({
    df_teachers_alluvial
  })
  
  
  ############################################3
  # Events triggering
  ############################################3
  
  last_triggered <- reactiveVal('None')
  
  # Observe changes input 'knowledge_about'
  observeEvent(input$knowledge_about, {
    last_triggered('knowledge_about')
  })
  
  # Observe changes on 'mcknowledge_about'
  observeEvent(input$mcknowledge_about, {
    last_triggered('mcknowledge_about')
  })
  

  # Observe changes on 'knowledge_aboutsvp'
  observeEvent(input$knowledge_aboutsvp, {
    last_triggered('knowledge_aboutsvp')
  })
  
  combo_choices_ka <- c('Select a variable' = 'select', 'Female body' = 'Knowledge_awoman', 'Male body' = 'Knowledge_aman')
  combo_choices_mka <- c('Select a variable' = 'select', 'understanding of what masturbation is' = 'Masturbation','understanding of what contraceptive methods are' = 'Contraceptive')
  combo_choices_svp <- c('Select a variable' = 'select', 'Knowledge about SVP' = 'Knowledge_asvp', 'Address SVP with Children' = 'Address_svp', 'Teaching SVP to ChWD in the Classroom' = 'Teaching_svp')

  ############################################3
  # Alluvial Plot Children
  ############################################3
  
  
  output$plot1 <- renderPlot({
    
    req(last_triggered())

    if(last_triggered() == 'knowledge_about'){

      if(input$knowledge_about != 'select'){
        req(input$knowledge_about)
      
        dataf() %>%
          ggplot(aes_string(axis1='Disability', axis2='Gender', axis3=input$knowledge_about, axis4='Age')) +
          geom_alluvium(aes(fill=Disability), width=1/12) +
          geom_stratum(width=1/12, fill='lightcyan', color='cyan', alpha=0.4) +
          #geom_label(stat = "stratum", aes(label = after_stat(stratum))) +
          geom_text(stat = 'stratum',
                    aes(label = after_stat(stratum))) +
          scale_x_discrete(limits = c('Disability', 'Gender', paste('Knowledge about ',names(combo_choices_ka)[combo_choices_ka == input$knowledge_about],'', sep =''), 'Age (years)'),
                           expand = c(0.10, 0.05))+
          theme_wsj() + 
          labs(title = paste('Children\'s knowledge about ', names(combo_choices_ka)[combo_choices_ka == input$knowledge_about], sep='' ),)
      }
    }else if(last_triggered() == 'mcknowledge_about'){

      if(input$mcknowledge_about != 'select'){
        req(input$mcknowledge_about)
        
        dataf() %>%
          ggplot(aes_string(axis1='Disability', axis2='Gender', axis3='Age', axis4=input$mcknowledge_about)) +
          geom_alluvium(aes(fill=Disability), width=1/12) +
          geom_stratum(width=1/12, fill='lightcyan', color='cyan', alpha=0.4) +
          #geom_label(stat = "stratum", aes(label = after_stat(stratum))) +
          geom_text(stat = 'stratum',
                    aes(label = after_stat(stratum))) +
          scale_x_discrete(limits = c('Disability', 'Gender', 'Age (years)', str_replace(names(combo_choices_mka)[combo_choices_mka == input$mcknowledge_about],'understanding of what','Understands what\n')),
                           expand = c(0.10, 0.05))+
          theme_wsj() +
          labs(title = paste('Children\'s ', names(combo_choices_mka)[combo_choices_mka == input$mcknowledge_about], sep='' ),)
      }
    }
    
    
  })
  
  
  output$dynamic_paragraph_1 <- renderUI({
    req(last_triggered())
    
    if(last_triggered() == 'knowledge_about'){
      
      if(input$knowledge_about == 'Knowledge_awoman'){
        HTML('
          <h5> <strong> Figure A1. </strong> Level of knowledge that surveyed children have about the female body, considering their disability, gender, and age. </h5>
          <br /> 
          
          <p><strong>Figure A1</strong> represents the level of knowledge that children have regarding the parts of the female body. Four variables were considered to organize the relationships: <strong>disability</strong>, <strong>gender</strong>, <strong>which body parts they know</strong>, and <strong>age</strong>.</p>

          <p>The results show that <strong>7 girls</strong> and <strong>14 boys</strong> know all the parts of the female body, while the remaining <strong>4 boys</strong> have gaps in their knowledge:</p>
          <ul>
              <li><strong>1</strong> does not know where the <em>navel</em> is located.</li>
              <li><strong>1</strong> does not know where the <em>vagina</em> is located.</li>
              <li><strong>2</strong> do not know where the <em>breasts</em> and <em>vagina</em> are located.</li>
          </ul>
          
          <p>At first glance, no clear relationship can be established between children\'s level of knowledge about the female body and the <strong>severity of their disability</strong>. This is reflected in the fact that there are <strong>2 cases</strong> of children with <em>moderate intellectual disabilities</em> who know all the parts, while there is <strong>1 child</strong> with <em>mild intellectual disability</em> who does not know where the <em>navel</em> is located.</p>
               
         <p>A similar pattern is observed in children with <strong>autism</strong>: while <strong>one child</strong> knows all the body parts, <strong>another</strong> does not know where the <em>vagina</em> is located.</p>
        ')
      }else if(input$knowledge_about == 'Knowledge_aman'){
        HTML('
        
          <h5> <strong> Figure A2. </strong> Level of knowledge that surveyed children have about the male body, considering their disability, gender, and age. </h5>
          <br />
          
          <p><strong>Figure A2</strong> presents an alluvial diagram showing the level of knowledge that children have about the male body. As observed:</p>

          <ul>
              <li><strong>3 girls</strong> know all the parts.</li>
              <li><strong>3 girls</strong> do not know where the <em>testicles</em> are located.</li>
              <li><strong>1 girl</strong> does not know where the <em>testicles</em> and <em>penis</em> are located.</li>
          </ul>
          
          <p>In this case, it is also not feasible to establish a direct relationship. For example:</p>
          <ul>
              <li>There is <strong>1 girl</strong> with <em>moderate intellectual disability</em> who knows all the parts.</li>
              <li>Another girl with the same disability does not know where the <em>testicles</em> are located.</li>
          </ul>
          
          <p>For the boys:</p>
          <ul>
              <li><strong>15 boys</strong> know all the parts of the male body.</li>
              <li><strong>1 boy</strong> with <em>autism</em> does not know where the <em>navel</em> is located.</li>
              <li><strong>1 boy</strong> with <em>underachievement in school</em> does not know where the <em>testicles</em> are located.</li>
              <li>The last boy, who also has <em>autism</em>, does not know where the <em>chest</em>, <em>stomach</em>, <em>navel</em>, <em>legs</em>, and <em>feet</em> are located.</li>
          </ul>
        
        
        ')
      }
    }else if(last_triggered() == 'mcknowledge_about'){
      
      if(input$mcknowledge_about == 'Masturbation'){
        HTML('
          <h5> <strong> Figure B1. </strong> Knowledge that surveyed children have about masturbation, considering their disability, gender, and age. </h5>
          <br /> 
          
          <p>As illustrated in <strong>Figure B1</strong>, <strong>3 children with moderate intellectual disability</strong> and <strong>1 with severe intellectual disability</strong> do not know what <em>masturbation</em> is, compared to <strong>1 child with moderate intellectual disability</strong> who does understand the concept. In this case, a pattern can be observed that associates the understanding of this concept with the <strong>degree of disability</strong>.</p>

          <p>The same occurs with children with <strong>autism</strong>: <strong>3 do not know</strong> what masturbation is, while <strong>1 does</strong>.</p>
          
          <p>On the other hand, children with <strong>mild intellectual disability</strong> mostly <strong>understand the concept (6)</strong> compared to those who do not and have the same disability (<strong>2</strong>).</p>
          
          <p>If we analyze the data by <strong>gender</strong>, we notice that the <strong>majority of girls (5)</strong> do not know the concept compared to those who do (<strong>2</strong>). In the case of <strong>boys</strong>, the opposite occurs: <strong>8 do not know</strong> what it is, while <strong>2 do</strong>.</p>
        ')
      }else if (input$mcknowledge_about == 'Contraceptive'){
        HTML('
          <h5> <strong> Figure B2. </strong> Knowledge that surveyed children have about contraceptive methods, considering their disability, gender, and age. </h5>
          <br /> 
          
          <p>As shown in <strong>Figure B2</strong>, <strong>56%</strong> of the children do not know any contraceptive method (<strong>14</strong>), while the remaining <strong>44%</strong> do know one or more methods (<strong>11</strong>). </p>

        <p>From this group, <strong>9 boys</strong> indicate that they know about <em>condoms</em> and one or two additional methods, while <strong>2</strong> claim to know about contraceptive methods but do not name any.</p>
        
        <p>In the same context, <strong>4 girls</strong> are aware of at least one contraceptive method, while <strong>3</strong> are not. Among boys, <strong>11</strong> do not know any method, and <strong>7</strong> do know at least one.</p>
        
        <p>It is essential to recognize that this variable is <strong>critical</strong>, and the majority of children are unaware of contraceptive methods. Therefore, it is <strong>urgent</strong> to implement <em>workshops</em> and <em>educational activities</em> in this context.</p>

        ')        
      }
    }
    
  })
  
  
  
  ############################################3
  # Alluvial Plot Teachers
  ############################################3
  output$plot2 <- renderPlot({
    
    req(last_triggered())
    
    if(last_triggered() == 'knowledge_aboutsvp'){
      
      print(input$mckno)
      
      if(input$knowledge_aboutsvp == 'Knowledge_asvp'){
        req(input$knowledge_aboutsvp)
        
        dataft() %>%
          ggplot(aes_string(axis1='Gender', axis2='ExperienceChWD_Range', axis3 = 'Training',  axis4='Knows_about')) +
          geom_alluvium(aes(fill=Knows_about), width=1/12) +
          geom_stratum(width=1/12, fill='lightcyan', color='cyan', alpha=0.4) +
          #geom_label(stat = "stratum", aes(label = after_stat(stratum))) +
          geom_text(stat = 'stratum',
                    aes(label = after_stat(stratum))) +
          scale_x_discrete(limits = c('Gender', 'Experience with ChWD (years)', 'Training on SVP', 'Knowledge about SVP'),
                           expand = c(0.10, 0.05)) +
          theme_wsj() + 
          labs(title = 'Teachers\' knowledge about SVP with ChWD', fill = 'Knowledge about SVP' )
        
      }else if(input$knowledge_aboutsvp == 'Address_svp'){
        req(input$knowledge_aboutsvp)
        
        dataft() %>%
          ggplot(aes_string(axis1='Gender', axis2='ExperienceChWD_Range',  axis3='Knows_about', axis4 = 'Prevention_in_disability')) +
          geom_alluvium(aes(fill=Prevention_in_disability), width=1/12) +
          geom_stratum(width=1/12, fill='lightcyan', color='cyan', alpha=0.4) +
          #geom_label(stat = "stratum", aes(label = after_stat(stratum))) +
          geom_text(stat = 'stratum',
                    aes(label = after_stat(stratum))) +
          scale_x_discrete(limits = c('Gender','Exp', 'Knowledge about SVP', 'Addressing SVP\n with ChWD'),
                           expand = c(0.10, 0.05)) +
          theme_wsj() + 
          labs(title = 'Teachers\' perceptions about addressing SVP with ChWD', fill = 'Addressing SVP in ChWD' )
      }else if(input$knowledge_aboutsvp == 'Teaching_svp'){
        req(input$knowledge_aboutsvp)
        
        dataft() %>%
          ggplot(aes_string(axis1='Gender', axis2='Knows_about', axis3 = 'Teach_violence_prev')) +
          geom_alluvium(aes(fill=Knows_about), width=1/12) +
          geom_stratum(width=1/12, fill='lightcyan', color='cyan', alpha=0.4) +
          #geom_label(stat = "stratum", aes(label = after_stat(stratum))) +
          geom_text(stat = 'stratum',
                    aes(label = after_stat(stratum))) +
          scale_x_discrete(limits = c('Gender', 'Knowledge about SVP', 'Teaches SVP'),
                           expand = c(0.10, 0.05)) +
          theme_wsj() + 
          labs(title = 'Teaching SVP to ChWD in the Classroom', fill = 'Knowledge about SVP' )
      }
    }
    
    
    
    
  })
  
  
  output$dynamic_paragraph_2 <- renderUI({
    req(last_triggered())
    
    if(last_triggered() == 'knowledge_aboutsvp'){
      
      if(input$knowledge_aboutsvp == 'Knowledge_asvp'){
        HTML('
          <h5> <strong> Figure C1. </strong> Knowledge of surveyed teachers about Sexual Violence Prevention (SVP) and Health Self-Care, considering their gender, years of experience working with Children with Disabilities (ChWD), and whether they have received training in SVP. </h5>
          <br /> 
          
          <p>In <strong>Figure C1</strong>, it can be observed that <strong>66% (28)</strong> of teachers state that they know <em>"what is necessary"</em> about <strong>Sexual Violence Prevention (SVP)</strong>, even though they have received training on the topic. Only <strong>9% (4)</strong> of the teachers who have received training indicate that they know <em>“a lot"</em> about the subject.</p>

          <p>Among the teachers who have <strong>not received training</strong>, <strong>21% (9)</strong> indicate that they know <em>"what is necessary"</em>, while only one teacher states that they know <em>"very little"</em>.</p>
          
          <p>In general terms:</p>
          <ul>
              <li><strong>88% (37)</strong> of teachers indicate they know <em>"enough"</em> about the topic.</li>
              <li><strong>9% (4)</strong> say they know <em>"a lot"</em>.</li>
              <li>Only <strong>one teacher</strong> indicates they know <em>"very little"</em>.</li>
          </ul>

        ')
      }else if(input$knowledge_aboutsvp == 'Address_svp'){
        HTML('
          <h5> <strong> Figure C2. </strong> Teachers\' perception regarding the level of difficulty in addressing the topic of Sexual Violence Prevention (SVP) in children with disabilities, considering gender, years of experience, and level of knowledge about the topic. </h5>
          <br /> 
          
          <p>Regarding the <strong>level of difficulty</strong> in addressing the topic of <strong>Sexual Violence Prevention (SVP)</strong> in children with disabilities (<strong>Figure C2</strong>), it was noted that teachers who indicate they know <em>“a lot"</em> about the topic have <strong>different perceptions</strong> depending on their experience working with these children.</p>

          <p>For example:</p>
          <ul>
              <li><strong>Two teachers</strong> with <strong>0 years of experience</strong> consider addressing the topic to be <em>“somewhat difficult"</em> and <em>“difficult."</em></li>
              <li>The other two teachers, with experience ranging from <strong>1 to 5 years</strong> and <strong>more than 20 years</strong>, perceive the activity as <em>“very easy."</em></li>
          </ul>
          
          <p><strong>59% (25)</strong> of teachers who indicate they know <em>“what is necessary"</em> about SVP perceive addressing the topic as <em>“somewhat difficult."</em> Their years of experience are not homogeneous, varying across all experience ranges. This indicates that, more than years of experience, the ability to address these topics appropriately depends significantly on their <strong>level of knowledge.</strong></p>
          
          <p>Similarly, <strong>19% (8)</strong> of teachers consider addressing the topic to be <em>“easy."</em> Among this group:</p>
          <ul>
              <li><strong>1 teacher</strong> has <strong>0 years</strong> of experience working with children with disabilities.</li>
              <li><strong>4 teachers</strong> have <strong>1 to 5 years</strong> of experience.</li>
              <li><strong>3 teachers</strong> have <strong>6 to 10 years</strong> of experience.</li>
              <li><strong>1 teacher</strong> has <strong>more than 20 years</strong> of experience.</li>
          </ul>
          
          <p>It is clearly observed that the response of the teacher with <strong>0 years of experience</strong> seems <strong>inconsistent</strong> with the overall trend.</p>
        ')
      }else if(input$knowledge_aboutsvp == 'Teaching_svp'){
        HTML('
          <h5> <strong> Figure C3. </strong> Teachers who address the topic of Sexual Violence Prevention (SVP) in class, considering their gender and level of knowledge on the topic. </h5>
          <br /> 
          
          <p>Based on the information presented in <strong>Figure C3</strong>, it can be observed that <strong>9% (4)</strong> of teachers who indicate they know <em>“a lot"</em> about the topic do address it in class.</p>

          <p>Teachers who know <em>"what is necessary"</em> about the topic are divided as follows:</p>
          <ul>
              <li><strong>23% (10)</strong> do <strong>not</strong> address it in class.</li>
              <li><strong>64% (27)</strong> <strong>do</strong> address it in class.</li>
          </ul>
          
          <p>The only teacher who indicates knowing <em>"very little"</em> about the topic does <strong>not</strong> address it in class.</p>
          
          <p>In this regard, it becomes <strong>urgent</strong> that teachers who address the topic with children with disabilities have access to more <strong>training courses</strong>. This would allow them to improve their <strong>level of knowledge</strong> and, consequently, provide a better <strong>teaching process</strong> in this area.</p>
          
        ')
      }
      
    }
  })
  
}

shinyApp(ui, server, 
         options = list(
           height = 800,
           lauch.browser = TRUE
         )
)
