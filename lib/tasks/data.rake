namespace :data do
  desc "Create an initial dataset"
  task dataset: :environment do
    [Feedback, UserSquadHistoryEntry, Squad, User, Area].each { |klass| klass.delete_all }

    ### Flags ###
    uruguay = 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/google/223/flag-for-uruguay_1f1fa-1f1fe.png'
    argentina = 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/google/223/flag-for-argentina_1f1e6-1f1f7.png'
    bulgaria = 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/google/223/flag-for-bulgaria_1f1e7-1f1ec.png'
    germany = 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/google/223/flag-for-germany_1f1e9-1f1ea.png'
    usa = 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/google/223/flag-for-united-states_1f1fa-1f1f8.png'
    belarus = 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/google/223/flag-for-belarus_1f1e7-1f1fe.png'

    ### Areas ###
    Area.create(name: 'IT', picture: 'TODO')
    Area.create(name: 'Sales', picture: 'TODO')
    Area.create(name: 'Marketing', picture: 'TODO')
    Area.create(name: 'Operations', picture: 'TODO')
    Area.create(name: 'Board', picture: 'TODO')

    ### Chapters ###
    android = Chapter.create(name: 'Android', picture_url: 'https://imagizer.imageshack.com/img922/2830/s6KF7O.png')
    ios = Chapter.create(name: 'iOS', picture_url: 'https://imagizer.imageshack.com/img923/1875/iaOVRK.png')
    frontend = Chapter.create(name: 'Front End', picture_url: 'https://imagizer.imageshack.com/img923/2502/EzT95s.png')
    backend = Chapter.create(name: 'Backend', picture_url: 'https://imagizer.imageshack.com/img921/9555/4SC76j.png')
    product = Chapter.create(name: 'Product', picture_url: 'https://imagizer.imageshack.com/img922/5974/IrSHUp.jpg')
    qa = Chapter.create(name: 'QA', picture_url: 'https://imagizer.imageshack.com/img924/544/E2XX6k.jpg')
    devops = Chapter.create(name: 'DevOps', picture_url: 'https://imagizer.imageshack.com/img921/7577/5iAjay.jpg')
    hr = Chapter.create(name: 'HR', picture_url: nil)
    ############


    ### CORE ###
    core = Squad.create!(name: 'Core', product_owner_id: nil, scrum_master_id: nil, picture_url: 'https://imagizer.imageshack.com/img921/4467/8OuVI4.png')
    marcher = User.create!(first_name: 'Diego', last_name: 'Marcher', email: 'dmarcher@theappraisallane.com',
                 position: 2, current_squad: core, picture_url: 'https://imagizer.imageshack.com/img922/1396/X5irXf.png',
                           chapter: android, slack_id: 'DCLE2RTRB', slack_name: 'Diego')
    mathi = User.create!(first_name: 'Mathias', last_name: 'Carignani', email: 'mathias@theappraisallane.com',
                         position: 3, current_squad: core, picture_url: 'https://imagizer.imageshack.com/img922/712/K4IYXj.png',
                         chapter: ios, slack_id: 'DCMHF9XD1', slack_name: 'Mathias')
    ios.update(chapter_lead: mathi)
    android.update(chapter_lead: marcher)
    reed = User.create!(first_name: 'Reed', last_name: 'Wilson', email: 'rwilson@theappraisallane.com',
                        position: 5, current_squad: core, chapter: product,
                        picture_url: 'https://imagizer.imageshack.com/img921/7270/6iWsII.png', flag_url: usa)
    javi = User.create!(first_name: 'Javier', last_name: 'Gonzalez', email: 'jgonzalez@theappraisallane.com',
                        position: 1, current_squad: core, picture_url: 'https://imagizer.imageshack.com/img923/8409/1hkuRj.png',
                        chapter: backend, slack_id: 'DCLE3NCLV', slack_name: 'Javi')
    User.create!(first_name: 'Jaime', last_name: 'Gomez', email: 'jaime.gomez@theappraisallane.com',
                 position: 2, current_squad: core, picture_url: 'https://imagizer.imageshack.com/img924/5448/s6qFV7.png',
                 chapter: android, slack_id: 'DCP2R8M7V', slack_name: 'Jaime')
    User.create!(first_name: 'Ignacio', last_name: 'Fernandez', email: 'ifernandez@theappraisallane.com',
                 position: 0, current_squad: core,
                 chapter: qa, picture_url: 'https://imagizer.imageshack.com/img922/7348/HX01Nh.png',
                 slack_id: 'DDS0W68JZ', slack_name: 'NachoQa')
    User.create!(first_name: 'Edith', last_name: 'Alvarado', email: 'ealvarado@theappraisallane.com',
                 position: 0, current_squad: core,
                 chapter: qa, picture_url: 'https://imagizer.imageshack.com/img924/3813/tUdKiv.png',
                 slack_id: 'DHJ9VU4KX', slack_name: 'Edith')
    User.create!(first_name: 'Gonzalo', last_name: 'Barrios', email: 'gbarrios@theappraisallane.com',
                 position: 3, current_squad: core,
                 chapter: ios, picture_url: 'https://imagizer.imageshack.com/img923/7250/zr8b74.png',
                 slack_id: 'DGN3P0CM7', slack_name: 'Gonzalo')
    User.create!(first_name: 'Denis', last_name: 'Trubenkov', email: 'dtrubenkov@theappraisallane.com',
                 position: 3, current_squad: core, picture_url: 'https://imagizer.imageshack.com/img921/6001/N38GGB.png',
                 chapter: ios, slack_id: 'DPDASEKU2', slack_name: 'Den', flag_url: belarus)
    User.create!(first_name: 'Todor', last_name: 'Todorin', email: 'ttodorin@theappraisallane.com',
                 position: 4, current_squad: core, chapter: frontend, slack_id: 'DL2PSU62Z', slack_name: 'Toti',
                 picture_url: 'https://imagizer.imageshack.com/img923/4371/uHm2EW.png', flag_url: bulgaria)
    core.update!(product_owner: reed, scrum_master: javi)
    puts 'Finished creating core data'

    #### REATAIL ####
    retail = Squad.create!(name: 'Retail', product_owner_id: nil, scrum_master_id: nil, picture_url: 'https://imagizer.imageshack.com/img924/3609/IQ3fQI.png')
    scotty = User.create!(first_name: 'Scott', last_name: 'Bernal', email: 'sbernal@theappraisallane.com',
                          position: 5, current_squad: retail, chapter: product,
                          picture_url: 'https://imagizer.imageshack.com/img922/1979/IIEKV9.png', flag_url: usa)
    mati_t = User.create!(first_name: 'Matias', last_name: 'Tuduri', email: 'mtuduri@theappraisallane.com',
                          position: 4, current_squad: retail, chapter: frontend, slack_id: 'U8A11NPMJ', slack_name: 'Matias',
                          picture_url: 'https://imagizer.imageshack.com/img924/8480/x8WRF5.png')

    german = User.create!(first_name: 'German', last_name: 'Quinteros', email: 'gquinteros@theappraisallane.com',
                          position: 4, current_squad: retail, chapter: frontend, slack_id: 'DLSB21UUT',
                          slack_name: 'German Quinteros', picture_url: 'https://imagizer.imageshack.com/img923/7167/zUEUUV.png')
    frontend.update(chapter_lead: mati_t)
    agus = User.create!(first_name: 'Agustin', last_name: 'Taruselli', email: 'ataruselli@theappraisallane.com',
                        position: 0, picture_url: 'https://imagizer.imageshack.com/img922/3830/YLvbaP.jpg',
                        current_squad: retail, chapter: qa, slack_id: 'DCL9H0EAE', slack_name: 'Agustin')
    cerve = User.create!(first_name: 'Pablo', last_name: 'Cervenansky', email: 'pablo@theappraisallane.com',
                        position: 1, picture_url: 'https://imagizer.imageshack.com/img924/9021/IzgVRi.png',
                         current_squad: retail, chapter: backend, slack_id: 'DG5HTQNKS', slack_name: 'Pablo Cerve')

    retail.update!(product_owner: scotty, scrum_master: mati_t)
    puts 'Finished creating retail data'
    ################

    ### Submissions
    submissions = Squad.create!(name: 'Submissions', product_owner_id: nil, scrum_master_id: nil, picture_url: 'https://imagizer.imageshack.com/img924/7467/JhnkoM.png')
    mike = User.create!(first_name: 'Mike', last_name: 'Latiak', email: 'mlatiak@theappraisallane.com', position: 5,
                        current_squad: submissions, chapter: product,
                        picture_url: 'https://imagizer.imageshack.com/img924/4171/2AkixT.png', flag_url: usa)
    mauri = User.create!(first_name: 'Mauricio', last_name: 'Vignale', email: 'mvignale@theappraisallane.com',
                          position: 2, current_squad: submissions, chapter: android,
                         picture_url: 'https://imagizer.imageshack.com/img921/2102/Oq27vR.png', slack_id: 'DCNSH8V3Q', slack_name: 'Mauri')
    submissions.update!(product_owner: mike, scrum_master: mauri)
    kaiser = User.create!(first_name: 'Christian', last_name: 'Schmeichel', email: 'cschmeichel@theappraisallane.com',
                          position: 1, current_squad: submissions,
                          picture_url: 'https://imagizer.imageshack.com/img923/3685/6x6hDP.png',
                          chapter: backend, slack_id: 'DCKHPR1RN', slack_name: 'Christian')
    submissions.update!(product_owner: mike, scrum_master: mauri)
    backend.update(chapter_lead: kaiser)
    product.update(chapter_lead: mike)
    diego_g = User.create!(first_name: 'Diego', last_name: 'Gawenda', email: 'dgawenda@theappraisallane.com',
                           position: 0, current_squad: nil,
                           chapter: qa, picture_url: 'https://imagizer.imageshack.com/img922/9391/kQK6wk.png',
                           slack_id: 'DCNQL51UP', slack_name: 'Diegote')
    User.create!(first_name: 'Marcia', last_name: 'Gilardi', email: 'mgilardi@theappraisallane.com',
                           position: 2, current_squad: submissions, picture_url: 'https://imagizer.imageshack.com/img924/3926/55CSZs.png',
                           chapter: android, slack_id: 'DM4GZ6PKQ', slack_name: 'Marcia')
    User.create!(first_name: 'Gustavo', last_name: 'Villa', email: 'gvilla@theappraisallane.com',
                 position: 1, current_squad: submissions, picture_url: 'https://imagizer.imageshack.com/img923/1461/EkEFeR.png',
                 chapter: backend, slack_id: 'DCZSLLQDU', slack_name: 'Chocho')
    User.create!(first_name: 'Gianfranco', last_name: 'Zabarino', email: 'gfzabarino@theappraisallane.com',
                 position: 3, current_squad: submissions, picture_url: 'https://imagizer.imageshack.com/img921/4633/4IOAAG.png',
                 chapter: backend, slack_id: 'DD3LLEP1C', slack_name: 'gianny', flag_url: argentina)
    User.create!(first_name: 'Rodrigo', last_name: 'Vazquez', email: 'rvazquez@theappraisallane.com',
                 position: 0, current_squad: submissions,
                 chapter: qa, picture_url: 'https://imagizer.imageshack.com/img922/3120/IMu7c6.png',
                 slack_id: 'DCY15QSG5', slack_name: 'Rod Vaz')
    User.create!(first_name: 'Majo', last_name: 'Andrade', email: 'mandrade@theappraisallane.com',
                 position: 0, current_squad: submissions,
                 chapter: qa, picture_url: 'https://imagizer.imageshack.com/img921/7061/RGie6E.png',
                 slack_id: 'DEE0GBB99', slack_name: 'Majo')
    qa.update(chapter_lead: diego_g)
    puts 'Finished creating submissions data'

    ####
    #
    ## Devops ###
    devops_squad = Squad.create!(name: 'DevOps', product_owner_id: nil, scrum_master_id: nil, picture_url: 'https://imagizer.imageshack.com/img921/7577/5iAjay.jpg')
    nacho = User.create!(first_name: 'Ignacio', last_name: 'Capurro', email: 'nacho@theappraisallane.com', position: 7,
                         picture_url: 'https://imagizer.imageshack.com/img923/1923/VvnaK0.png',
                         current_squad: nil, chapter: nil, slack_id: 'DCL9GMS5Q', slack_name: 'nacho')
    kenny = User.create!(first_name: 'Keneth', last_name: 'Belitzky', email: 'kbelitzky@theappraisallane.com', position: 6,
                         picture_url: 'https://imagizer.imageshack.com/img923/6201/sNIRM2.png',
                         current_squad: devops_squad, chapter: devops, slack_id: 'DCLQ7ENEL', slack_name: 'Kenny')
    cristian = User.create!(first_name: 'Cristian', last_name: 'Bermudez', email: 'cbermudez@theappraisallane.com', position: 6,
                            picture_url: 'https://imagizer.imageshack.com/img921/4705/UuHOTe.png',
                            current_squad: devops_squad, chapter: devops, slack_id: 'DGPGF44T1',
                            slack_name: 'Cristian Bermudez')
    devops_squad.update!(product_owner: nacho, scrum_master: kenny)
    devops.update(chapter_lead: kenny)

    User.create!(first_name: 'Shannon', last_name: 'Lunsford', email: 'slunsford@theappraisallane.com', position: 5,
                 current_squad: nil, chapter: product,
                 picture_url: 'https://imagizer.imageshack.com/img922/4223/eSo3BH.png', flag_url: usa)

    User.create!(first_name: 'Sebastian', last_name: 'Arbildi', email: 'sarbildi@theappraisallane.com', position: 0,
                 current_squad: nil, chapter: product,
                 picture_url: 'https://imagizer.imageshack.com/img922/786/joLaqo.png', slack_id: 'DKF5Y3MED',
                 slack_name: 'Sebastian Arbildi')



    ##############

    ### Notifications ###
    notifications = Squad.create!(name: 'Notifications', product_owner_id: nacho, scrum_master_id: nil, picture_url: 'https://imagizer.imageshack.com/img924/3720/HstELH.png')
    galaxy = User.create!(first_name: 'Hernan', last_name: 'Acosta', email: 'hacosta@theappraisallane.com',
                          position: 1, current_squad: notifications, picture_url: 'https://imagizer.imageshack.com/img923/941/0CAZT5.png',
                          chapter: backend, slack_id: 'DHFE4UJTY', slack_name: 'Hernan')

    User.create!(first_name: 'Esteban', last_name: 'Bordon', email: 'ebordon@theappraisallane.com',
                 position: 1, current_squad: notifications, picture_url: 'https://imagizer.imageshack.com/img922/7923/Irq2FP.png',
                 chapter: backend, slack_id: 'DE4LPRJ74', slack_name: 'Esteban')
    User.create!(first_name: 'Federico', last_name: 'Monesiglio', email: 'fmonesiglio@theappraisallane.com',
                 position: 0, current_squad: notifications,
                 chapter: qa, picture_url: 'https://imagizer.imageshack.com/img924/5048/gHdJd5.png',
                 slack_id: 'DJ4LDJA0P', slack_name: 'Federico Monesiglio')

    notifications.update!(scrum_master: galaxy)
    puts 'Finished creating notifications data'

    ### DP ###
    dp = Squad.create!(name: 'Data Processing', product_owner_id: nacho, scrum_master_id: nil, picture_url: 'https://imagizer.imageshack.com/img924/3658/zbW674.png')
    User.create!(first_name: 'Pia', last_name: 'Banales', email: 'pbanales@theappraisallane.com',
                 position: 1, current_squad: dp, picture_url: 'https://imagizer.imageshack.com/img924/3963/RTvE9E.png',
                 chapter: backend, slack_id: 'DHWBBANNR', slack_name: 'Pia')

    pravera = User.create!(first_name: 'Pablo', last_name: 'Ravera', email: 'pravera@theappraisallane.com',
                           position: 1, current_squad: dp, picture_url: 'https://imagizer.imageshack.com/img921/6821/cklYOE.png',
                           chapter: backend, slack_id: 'DDZB96PEC', slack_name: 'Pablo Ravera Felix')


    dp.update!(scrum_master: pravera)
    puts 'Finished creating DP data'


    ### DP ###
    dp = Squad.create!(name: 'Data Intelligence', product_owner_id: nacho, scrum_master_id: nil, picture_url: 'https://imagizer.imageshack.com/img921/8420/wAPPwi.png')
    vero = User.create!(first_name: 'Veronica', last_name: 'Bassagoda', email: 'vbassagoda@theappraisallane.com',
                 position: 8, current_squad: dp, picture_url: 'https://imagizer.imageshack.com/img921/1057/fhV05t.png',
                 chapter: nil, slack_id: 'DKQLJP7FT', slack_name: 'Vero')


    dp.update!(scrum_master: vero)
    puts 'Finished creating DI data'

    ### HR ###
    User.create!(first_name: 'Paula', last_name: 'Prato', email: 'pprato@theappraisallane.com',
                 position: 9, current_squad: nil, picture_url: 'https://imagizer.imageshack.com/img924/6456/JodHmA.png',
                 chapter: hr, slack_id: 'DCNSWV9GX', slack_name: 'Poli')
    User.create!(first_name: 'Milagros', last_name: 'Rodriguez', email: 'mrodriguez@theappraisallane.com',
                 position: 9, current_squad: nil, picture_url: 'https://imagizer.imageshack.com/img924/207/OmykGx.png',
                 chapter: hr, slack_id: 'DHS6CJHDW', slack_name: 'Mili')
    User.create!(first_name: 'Carolina', last_name: 'Winarz', email: 'cwinarz@theappraisallane.com',
                 position: 9, current_squad: nil, picture_url: 'https://imagizer.imageshack.com/img921/8482/xTvP2m.png',
                 chapter: hr, slack_id: 'DP2FL3JTT', slack_name: 'Caro')

    puts 'Finished creating HR data'

    ## Leader ##
    [marcher, kaiser, diego_g, kenny, mathi, mati_t].each do |lead|
      lead.update(leader: nacho)
    end

    #############

    ############# FEEDBACK #############
    Feedback.create! text: 'Very good quality of work. The work has a lot of quality. Never seen this kind of quality of work before.',
                     sender_id: mati_t.id, receiver_id: german.id, rating: 4, category: 0
    Feedback.create! text: 'Incredible quantity of work. Never seen this amount of work quantity in my whole life.',
                     sender_id: marcher.id, receiver_id: german.id, rating: 4, category: 1
    Feedback.create! text: "Very reliable worker. He's always around, so you can aways rely on him.",
                     sender_id: mati_t.id, receiver_id: german.id, rating: 3, category: 2
    Feedback.create! text: 'Very unprofessional employee. Very low work quantity and quality. Not dependable.',
                     sender_id: mati_t.id, receiver_id: german.id, rating: 1, category: 3

    Feedback.create! text: 'Very good quality of work. The work has a lot of quality. Never seen this kind of quality of work before.',
                     receiver_id: marcher.id, sender_id: german.id, rating: 4, category: 0
    Feedback.create! text: 'Incredible quantity of work. Never seen this amount of work quantity in my whole life.',
                     receiver_id: mati_t.id, sender_id: german.id, rating: 4, category: 1
    Feedback.create! text: "Very reliable worker. He's always around, so you can aways rely on him.",
                     receiver_id: mati_t.id, sender_id: german.id, rating: 3, category: 2
    Feedback.create! text: 'Very unprofessional employee. Very low work quantity and quality. Not dependable.',
                     receiver_id: mati_t.id, sender_id: german.id, rating: 1, category: 3

    puts 'Finished creating feedbacks'

    ############# SQUAD HISTORY #############
    UserSquadHistoryEntry.create(user: kaiser, squad: core, date_from: DateTime.new(2018, 8, 1), date_to: DateTime.new(2019, 12, 31))
    UserSquadHistoryEntry.create(user: kaiser, squad: retail, date_from: DateTime.new(2019, 1, 1), date_to: DateTime.new(2019, 6, 1))
    UserSquadHistoryEntry.create(user: kaiser, squad: submissions, date_from: DateTime.new(2019, 6, 2), date_to: nil)
  end
end
