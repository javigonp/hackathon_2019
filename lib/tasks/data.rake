namespace :data do
  desc "Create an initial dataset"
  task dataset: :environment do
    Squad.delete_all
    User.delete_all

    puts 'Creating core data'
    core = Squad.create!(name: 'CORE', product_owner_id: nil, scrum_master_id: nil)
    reed = User.create!(first_name: 'Reed', last_name: 'Wilson', email: 'rwilson@test.com', position: 5)
    javi = User.create!(first_name: 'Javi', last_name: 'Gonzalez', email: 'jgonzalezn@test.com', position: 1)
    core.update!(product_owner: reed, scrum_master: javi)
    puts 'Finished creating core data'
  end

end
