namespace :data do
  desc "Create an initial dataset"
  task dataset: :environment do
    Squad.delete_all
    User.delete_all

    ### CORE ###
    core = Squad.create!(name: 'CORE', product_owner_id: nil, scrum_master_id: nil)
    reed = User.create!(first_name: 'Reed', last_name: 'Wilson', email: 'rwilson@theappraisallane.com', position: 5)
    javi = User.create!(first_name: 'Javier', last_name: 'Gonzalez', email: 'jgonzalez@theappraisallane.com',
                        position: 1)
    core.update!(product_owner: reed, scrum_master: javi)
    puts 'Finished creating core data'

    #### REATAIL ####
    retail = Squad.create!(name: 'RETAIL', product_owner_id: nil, scrum_master_id: nil)
    scotty = User.create!(first_name: 'Scott', last_name: 'Bernal', email: 'sbernal@theappraisallane.com', position: 5)
    mati_t = User.create!(first_name: 'Matias', last_name: 'Tuduri', email: 'mtuduri@theappraisallane.com',
                        position: 4)
    agus = User.create!(first_name: 'Agustin', last_name: 'Taruselli', email: 'ataruselli@theappraisallane.com',
                        position: 0, picture_url: 'https://imagizer.imageshack.com/v2/280x200q90/921/CZe5QU.jpg')
    retail.update!(product_owner: scotty, scrum_master: mati_t)

    ################
  end

end
