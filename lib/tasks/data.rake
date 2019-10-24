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
    ############


    ### CORE ###
    core = Squad.create!(name: 'CORE', product_owner_id: nil, scrum_master_id: nil, picture_url: 'https://imagizer.imageshack.com/img921/4467/8OuVI4.png')
    marcher = User.create!(first_name: 'Diego', last_name: 'Marcher', email: 'dmarcher@theappraisallane.com',
                 position: 2, current_squad: core, picture_url: 'https://imagizer.imageshack.com/img922/1396/X5irXf.png',
                           chapter: android, slack_id: 'DCLE2RTRB', slack_name: 'Diego')
    mathi = User.create!(first_name: 'Mathias', last_name: 'Carignani', email: 'mathias@theappraisallane.com',
                         position: 3, current_squad: core, picture_url: 'https://imagizer.imageshack.com/img922/712/K4IYXj.png',
                         chapter: ios, slack_id: 'DCMHF9XD1', slack_name: 'Mathias')
    ios.update(chapter_lead: mathi)
    android.update(chapter_lead: marcher)
    reed = User.create!(first_name: 'Reed', last_name: 'Wilson', email: 'rwilson@theappraisallane.com', position: 5, current_squad: core, chapter: product, flag_url: usa)
    javi = User.create!(first_name: 'Javier', last_name: 'Gonzalez', email: 'jgonzalez@theappraisallane.com',
                        position: 1, current_squad: core, picture_url: 'https://imagizer.imageshack.com/img923/8409/1hkuRj.png',
                        chapter: backend, slack_id: 'DCLE3NCLV', slack_name: 'Javi')
    core.update!(product_owner: reed, scrum_master: javi)
    puts 'Finished creating core data'

    #### REATAIL ####
    retail = Squad.create!(name: 'RETAIL', product_owner_id: nil, scrum_master_id: nil, picture_url: 'https://imagizer.imageshack.com/img924/3609/IQ3fQI.png')
    scotty = User.create!(first_name: 'Scott', last_name: 'Bernal', email: 'sbernal@theappraisallane.com', position: 5, current_squad: retail, chapter: product, flag_url: usa)
    mati_t = User.create!(first_name: 'Matias', last_name: 'Tuduri', email: 'mtuduri@theappraisallane.com',
                          position: 4, current_squad: retail, chapter: frontend, slack_id: 'U8A11NPMJ', slack_name: 'Matias',
                          picture_url: 'https://imagizer.imageshack.com/img924/8480/x8WRF5.png')

    german = User.create!(first_name: 'German', last_name: 'Quinteros', email: 'gquinteros@theappraisallane.com',
                          position: 4, current_squad: retail, chapter: frontend, slack_id: 'DLSB21UUT', slack_name: 'German Quinteros')
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
    submissions = Squad.create!(name: 'SUBMISSIONS', product_owner_id: nil, scrum_master_id: nil, picture_url: 'https://imagizer.imageshack.com/img924/7467/JhnkoM.png')
    mike = User.create!(first_name: 'Mike', last_name: 'Latiak', email: 'mlatiak@theappraisallane.com', position: 5, current_squad: submissions, chapter: product, flag_url: usa)
    mauri = User.create!(first_name: 'Mauricio', last_name: 'Vignale', email: 'mvignale@theappraisallane.com',
                          position: 2, current_squad: submissions, chapter: android,
                         picture_url: 'https://imagizer.imageshack.com/img921/2102/Oq27vR.png', slack_id: 'DCNSH8V3Q', slack_name: 'Mauri')
    retail.update!(product_owner: mike, scrum_master: mauri)
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
    qa.update(chapter_lead: diego_g)
    puts 'Finished creating submissions data'

    ####
    #
    ## Devops ###
    devops_squad = Squad.create!(name: 'DEVOPS', product_owner_id: nil, scrum_master_id: nil, picture_url: 'https://imagizer.imageshack.com/img921/7577/5iAjay.jpg')
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

    ##############

    ## Leader ##
    [marcher, kaiser, diego_g, kenny, mathi, mati_t].each do |lead|
      lead.update(leader: nacho)
    end

    #############

    ############# FEEDBACK #############
    Feedback.create! text: 'Very good quality of work. The work has a lot of quality. Never seen this kind of quality of work before.',
                     sender_id: mati_t.id, receiver_id: german.id, rating: 4, category: 0
    Feedback.create! text: 'Incredible quantity of work. Never seen this amount of work quantity in my whole life.',
                     sender_id: mati_t.id, receiver_id: german.id, rating: 4, category: 1
    Feedback.create! text: "Very reliable worker. He's always around, so you can aways rely on him.",
                     sender_id: mati_t.id, receiver_id: german.id, rating: 3, category: 2
    Feedback.create! text: 'Very unprofessional employee. Very low work quantity and quality. Not dependable.',
                     sender_id: mati_t.id, receiver_id: german.id, rating: 1, category: 3
    puts 'Finished creating feedbacks'

    ############# SQUAD HISTORY #############
    UserSquadHistoryEntry.create(user: kaiser, squad: core, date_from: DateTime.new(2018, 8, 1), date_to: DateTime.new(2019, 12, 31))
    UserSquadHistoryEntry.create(user: kaiser, squad: retail, date_from: DateTime.new(2019, 1, 1), date_to: DateTime.new(2019, 6, 1))
    UserSquadHistoryEntry.create(user: kaiser, squad: submissions, date_from: DateTime.new(2019, 6, 2), date_to: nil)
  end
end
