namespace :data do
  desc "Create an initial dataset"
  task dataset: :environment do
    [UserSquadHistoryEntry, Squad, User, Feedback].each { |klass| klass.delete_all }

    ### Chapters ###
    android = Chapter.create(name: 'Android')
    ios = Chapter.create(name: 'iOS')
    frontend = Chapter.create(name: 'Front End')
    backend = Chapter.create(name: 'Backend')
    # qa = Chapter(name: 'QA')
    # devops = Chapter(name: 'DevOps')
    ############


    ### CORE ###
    core = Squad.create!(name: 'CORE', product_owner_id: nil, scrum_master_id: nil)
    marcher = User.create!(first_name: 'Diego', last_name: 'Marcher', email: 'dmarcher@theappraisallane.com',
                 position: 2, current_squad: core, picture_url: 'https://imagizer.imageshack.com/img922/1396/X5irXf.png')
    mathi = User.create!(first_name: 'Mathias', last_name: 'Carignani', email: 'mathias@theappraisallane.com',
                           position: 3, current_squad: core, picture_url: 'https://imageshack.com/i/pmX5irXfp')
    ios.update(chapter_lead: mathi)
    android.update(chapter_lead: marcher)
    reed = User.create!(first_name: 'Reed', last_name: 'Wilson', email: 'rwilson@theappraisallane.com', position: 5, current_squad: core)
    javi = User.create!(first_name: 'Javier', last_name: 'Gonzalez', email: 'jgonzalez@theappraisallane.com',
                        position: 1, current_squad: core, picture_url: 'https://imagizer.imageshack.com/img923/8409/1hkuRj.png')
    core.update!(product_owner: reed, scrum_master: javi)
    puts 'Finished creating core data'

    #### REATAIL ####
    retail = Squad.create!(name: 'RETAIL', product_owner_id: nil, scrum_master_id: nil)
    scotty = User.create!(first_name: 'Scott', last_name: 'Bernal', email: 'sbernal@theappraisallane.com', position: 5, current_squad: retail)
    mati_t = User.create!(first_name: 'Matias', last_name: 'Tuduri', email: 'mtuduri@theappraisallane.com',
                        position: 4, current_squad: retail)

    german = User.create!(first_name: 'German', last_name: 'Quinteros', email: 'gquinteros@theappraisallane.com',
                          position: 4, current_squad: retail)
    frontend.update(chapter_lead: mati_t)
    agus = User.create!(first_name: 'Agustin', last_name: 'Taruselli', email: 'ataruselli@theappraisallane.com',
                        position: 0, picture_url: 'https://imagizer.imageshack.com/img922/3830/YLvbaP.jpg', current_squad: retail)
    cerve = User.create!(first_name: 'Pablo', last_name: 'Cervenansky', email: 'pablo@theappraisallane.com',
                        position: 1, picture_url: 'https://imagizer.imageshack.com/img924/9021/IzgVRi.png', current_squad: retail)

    retail.update!(product_owner: scotty, scrum_master: mati_t)
    puts 'Finished creating retail data'
    ################

    ### Submissions
    submissions = Squad.create!(name: 'SUBMISSIONS', product_owner_id: nil, scrum_master_id: nil)
    mike = User.create!(first_name: 'Mike', last_name: 'Latiak', email: 'mlatiak@theappraisallane.com', position: 5, current_squad: submissions)
    mauri = User.create!(first_name: 'Mauricio', last_name: 'Vignale', email: 'mvignale@theappraisallane.com',
                          position: 2, current_squad: submissions)

    retail.update!(product_owner: mike, scrum_master: mauri)
    kaiser = User.create!(first_name: 'Christian', last_name: 'Schmeichel', email: 'cschmeichel@theappraisallane.com',
                        position: 1, current_squad: submissions, picture_url: 'https://imagizer.imageshack.com/img923/3685/6x6hDP.png')
    submissions.update!(product_owner: mike, scrum_master: mauri)
    backend.update(chapter_lead: kaiser)
    puts 'Finished creating submissions data'

    ####

    ############# FEEDBACK #############
    Feedback.create! text: 'Very good quality of work. The work has a lot of quality. Never seen this kind of quality of work before.',
                     sender_id: mati_t.id, receiver_id: german.id, rating: 5, category: 0
    Feedback.create! text: 'Incredible quantity of work. Never seen this amount of work quantity in my whole life.',
                     sender_id: mati_t.id, receiver_id: german.id, rating: 5, category: 1
    Feedback.create! text: "Very reliable worker. He's always around, so you can aways rely on him.",
                     sender_id: mati_t.id, receiver_id: german.id, rating: 4, category: 2
    Feedback.create! text: 'Very unprofessional employee. Very low work quantity and quality. Not dependable.',
                     sender_id: mati_t.id, receiver_id: german.id, rating: 1, category: 3
    puts 'Finished creating feedbacks'

  end
end
