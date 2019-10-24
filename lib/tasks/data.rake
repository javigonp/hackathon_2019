namespace :data do
  desc "Create an initial dataset"
  task dataset: :environment do
    Squad.delete_all
    User.delete_all

    ### Chapters ###
    android = Chapter.create(name: 'Android')
    ios = Chapter.create(name: 'iOS')
    frontend = Chapter.create(name: 'Front End')
    backend = Chapter.create(name: 'Backend')
    product = Chapter.create(name: 'Product')
    qa = Chapter.create(name: 'QA')
    # devops = Chapter(name: 'DevOps')
    ############


    ### CORE ###
    core = Squad.create!(name: 'CORE', product_owner_id: nil, scrum_master_id: nil)
    marcher = User.create!(first_name: 'Diego', last_name: 'Marcher', email: 'dmarcher@theappraisallane.com',
                 position: 2, current_squad: core, picture_url: 'https://imagizer.imageshack.com/img922/1396/X5irXf.png', chapter: android)
    mathi = User.create!(first_name: 'Mathias', last_name: 'Carignani', email: 'mathias@theappraisallane.com',
                           position: 3, current_squad: core, picture_url: 'https://imageshack.com/i/pmX5irXfp', chapter: ios)
    ios.update(chapter_lead: mathi)
    android.update(chapter_lead: marcher)
    reed = User.create!(first_name: 'Reed', last_name: 'Wilson', email: 'rwilson@theappraisallane.com', position: 5, current_squad: core, chapter: product)
    javi = User.create!(first_name: 'Javier', last_name: 'Gonzalez', email: 'jgonzalez@theappraisallane.com',
                        position: 1, current_squad: core, picture_url: 'https://imagizer.imageshack.com/img923/8409/1hkuRj.png', chapter: backend)
    core.update!(product_owner: reed, scrum_master: javi)
    puts 'Finished creating core data'

    #### REATAIL ####
    retail = Squad.create!(name: 'RETAIL', product_owner_id: nil, scrum_master_id: nil)
    scotty = User.create!(first_name: 'Scott', last_name: 'Bernal', email: 'sbernal@theappraisallane.com', position: 5, current_squad: retail, chapter: product)
    mati_t = User.create!(first_name: 'Matias', last_name: 'Tuduri', email: 'mtuduri@theappraisallane.com',
                        position: 4, current_squad: retail, chapter: frontend)

    german = User.create!(first_name: 'German', last_name: 'Quinteros', email: 'gquinteros@theappraisallane.com',
                          position: 4, current_squad: retail, chapter: frontend)
    frontend.update(chapter_lead: mati_t)
    agus = User.create!(first_name: 'Agustin', last_name: 'Taruselli', email: 'ataruselli@theappraisallane.com',
                        position: 0, picture_url: 'https://imagizer.imageshack.com/img922/3830/YLvbaP.jpg', current_squad: retail, chapter: qa)
    cerve = User.create!(first_name: 'Pablo', last_name: 'Cervenansky', email: 'pablo@theappraisallane.com',
                        position: 1, picture_url: 'https://imagizer.imageshack.com/img924/9021/IzgVRi.png', current_squad: retail, chapter: backend)

    retail.update!(product_owner: scotty, scrum_master: mati_t)
    puts 'Finished creating retail data'
    ################

    ### Submissions
    submissions = Squad.create!(name: 'SUBMISSIONS', product_owner_id: nil, scrum_master_id: nil)
    mike = User.create!(first_name: 'Mike', last_name: 'Latiak', email: 'mlatiak@theappraisallane.com', position: 5, current_squad: submissions, chapter: product)
    mauri = User.create!(first_name: 'Mauricio', last_name: 'Vignale', email: 'mvignale@theappraisallane.com',
                          position: 2, current_squad: submissions, chapter: android)

    retail.update!(product_owner: mike, scrum_master: mauri)
    kaiser = User.create!(first_name: 'Christian', last_name: 'Schmeichel', email: 'cschmeichel@theappraisallane.com',
                        position: 1, current_squad: submissions, picture_url: 'https://imagizer.imageshack.com/img923/3685/6x6hDP.png', chapter: backend)
    submissions.update!(product_owner: mike, scrum_master: mauri)
    backend.update(chapter_lead: kaiser)
    product.update(chapter_lead: mike)
    diego = User.create!(first_name: 'Diego', last_name: 'Gawenda', email: 'dgawenda@theappraisallane.com',
                          position: 0, current_squad: retail, chapter: qa)
    qa.update(chapter_lead: diego)
    puts 'Finished creating submissions data'

    ####
  end
end
