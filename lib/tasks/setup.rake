desc 'Ensure that code is not running in production environment'
task :not_production do
  raise 'do not run in production' if Rails.env.production?
end

desc 'Sets up the project by running migration and populating sample data'
task setup: [:environment, :not_production, 'db:drop', 'db:create', 'db:migrate'] do
  ["setup_sample_data"].each { |cmd| system "rake #{cmd}" }
end

def delete_all_records_from_all_tables
  ActiveRecord::Base.connection.schema_cache.clear!

  Dir.glob(Rails.root + 'app/models/*.rb').each { |file| require file }

  ActiveRecord::Base.descendants.each do |klass|
    klass.reset_column_information
    klass.delete_all
  end
end

desc 'Deletes all records and populates sample data'
task setup_sample_data: [:environment, :not_production] do
  delete_all_records_from_all_tables

  create_user email: 'sam@example.com'

  Region.transaction do
    create_region(name: "Central America",
                  abbr: "CA"
                 )
    create_region(name: "South America",
                  abbr: "SA"
                 )
    create_region(name: "Europe",
                  abbr: "EU"
                 )
    create_region(name: "Western Europe",
                  abbr: "WE"
                 )
    create_region(name: "Eastern Europe",
                  abbr: "EE"
                 )
    create_region(name: "Africa",
                  abbr: "AF"
                 )
    create_region(name: "Middle East",
                  abbr: "ME"
                 )
    create_region(name: "Central America",
                  abbr: "CA"
                 )
    create_region(name: "Asia",
                  abbr: "AS"
                 )
    create_region(name: "Southeast Asia",
                  abbr: "SE"
                 )
  end

  Country.transaction do
    # Superpowers
    create_country(name: "United States",
                  )
    create_country(name: "USSR",
                  )

    # Central America
    create_country(name: "Mexico",
                   stability: 2,
                   battleground: true,
                   vicinities_attributes: [region: Region.find_by(abbr: "CA")]
                  )
    create_country(name: "Cuba",
                   stability: 3,
                   battleground: true,
                   vicinities_attributes: [region: Region.find_by(abbr: "CA")]
                  )
    create_country(name: "Guatemala",
                   stability: 1,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "CA")]
                  )
    create_country(name: "El Salvador",
                   stability: 1,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "CA")]
                  )
    create_country(name: "Honduras",
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "CA")]
                  )
    create_country(name: "Nicaragua",
                   stability: 1,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "CA")]
                  )
    create_country(name: "Haiti",
                   stability: 1,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "CA")]
                  )
    create_country(name: "Dominican Republic",
                   stability: 1,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "CA")]
                  )
    create_country(name: "Costa Rica",
                   stability: 3,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "CA")]
                  )
    create_country(name: "Panama",
                   stability: 2,
                   battleground: true,
                   vicinities_attributes: [region: Region.find_by(abbr: "CA")]
                  )

    # South America
    create_country(name: "Venezuela",
                   stability: 2,
                   battleground: true,
                   vicinities_attributes: [region: Region.find_by(abbr: "SA")]
                  )
    create_country(name: "Ecuador",
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "SA")]
                  )
    create_country(name: "Columbia",
                   stability: 1,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "SA")]
                  )
    create_country(name: "Peru",
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "SA")]
                  )
    create_country(name: "Brazil",
                   stability: 2,
                   battleground: true,
                   vicinities_attributes: [region: Region.find_by(abbr: "SA")]
                  )
    create_country(name: "Bolivia",
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "SA")]
                  )
    create_country(name: "Chile",
                   stability: 3,
                   battleground: true,
                   vicinities_attributes: [region: Region.find_by(abbr: "SA")]
                  )
    create_country(name: "Paraguay",
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "SA")]
                  )
    create_country(name: "Argentina",
                   stability: 2,
                   battleground: true,
                   vicinities_attributes: [region: Region.find_by(abbr: "SA")]
                  )
    create_country(name: "Uruguay",
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "SA")]
                  )
    # Europe
    create_country(name: "Norway",
                   stability: 4,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "WE") }
                                          ]
                  )
    create_country(name: "Denmark",
                   stability: 3,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "WE") }
                                          ]
                  )
    create_country(name: "Sweden",
                   stability: 4,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "WE") }
                                          ]
                  )
    create_country(name: "United Kingdom",
                   stability: 5,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "WE") }
                                          ]
                  )
    create_country(name: "Canada",
                   stability: 4,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "WE") }
                                          ]
                  )
    create_country(name: "Benelux",
                   stability: 3,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "WE") }
                                          ]
                  )
    create_country(name: "West Germany",
                   stability: 4,
                   battleground: true,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "WE") }
                                          ]
                  )
    create_country(name: "France",
                   stability: 3,
                   battleground: true,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "WE") }
                                          ]
                  )
    create_country(name: "Spain/Portugal",
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "WE") }
                                          ]
                  )
    create_country(name: "Italy",
                   stability: 2,
                   battleground: true,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "WE") }
                                          ]
                  )
    create_country(name: "Turkey",
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "WE") }
                                          ]
                  )
    create_country(name: "Greece",
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "WE") }
                                          ]
                  )

    create_country(name: "Finland",
                   stability: 4,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "WE") },
                                           { region: Region.find_by(abbr: "EE") }
                                          ]
                  )
    create_country(name: "Austria",
                   stability: 4,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "WE") },
                                           { region: Region.find_by(abbr: "EE") }
                                          ]
                  )
    create_country(name: "East Germany",
                   stability: 3,
                   battleground: true,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "EE") }
                                          ]
                  )
    create_country(name: "Poland",
                   stability: 3,
                   battleground: true,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "EE") }
                                          ]
                  )
    create_country(name: "Czechoslovakia",
                   stability: 3,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "EE") }
                                          ]
                  )
    create_country(name: "Hungary",
                   stability: 3,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "EE") }
                                          ]
                  )
    create_country(name: "Romania",
                   stability: 3,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "EE") }
                                          ]
                  )
    create_country(name: "Yugoslavia",
                   stability: 3,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "EE") }
                                          ]
                  )
    create_country(name: "Bulgaria",
                   stability: 3,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "EU") },
                                           { region: Region.find_by(abbr: "EE") }
                                          ]
                  )

    #Africa
    create_country(name: "Morocco",             
                   stability: 3,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "AF")]
                  )
    create_country(name: "Algeria",             
                   stability: 2,
                   battleground: true, 
                   vicinities_attributes: [region: Region.find_by(abbr: "AF")]
                  )
    create_country(name: "Tunisia",             
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "AF")]
                  )
    create_country(name: "West African States", 
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "AF")]
                  )
    create_country(name: "Saharan States",      
                   stability: 1,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "AF")]
                  )
    create_country(name: "Sudan",               
                   stability: 1,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "AF")]
                  )
    create_country(name: "Ivory Coast",         
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "AF")]
                  )
    create_country(name: "Nigeria",             
                   stability: 1,
                   battleground: true, 
                   vicinities_attributes: [region: Region.find_by(abbr: "AF")]
                  )
    create_country(name: "Ethiopia",            
                   stability: 1,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "AF")]
                  )
    create_country(name: "Cameroon",            
                   stability: 1,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "AF")]
                  )
    create_country(name: "Zaire",               
                   stability: 1,
                   battleground: true, 
                   vicinities_attributes: [region: Region.find_by(abbr: "AF")]
                  )
    create_country(name: "Kenya",               
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "AF")]
                  )
    create_country(name: "Somalia",             
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "AF")]
                  )
    create_country(name: "Angola",              
                   stability: 1,
                   battleground: true, 
                   vicinities_attributes: [region: Region.find_by(abbr: "AF")]
                  )
    create_country(name: "Zimbabwe",            
                   stability: 1,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "AF")]
                  )
    create_country(name: "SE African States",   
                   stability: 1,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "AF")]
                  )
    create_country(name: "Botswana",            
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "AF")]
                  )
    create_country(name: "South Africa",        
                   stability: 3,
                   battleground: true, 
                   vicinities_attributes: [region: Region.find_by(abbr: "AF")]
                  )

    # Middle East
    create_country(name: "Lebanon",
                   stability: 1,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "ME")]
                  )
    create_country(name: "Syria",
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "ME")]
                  )
    create_country(name: "Israel",
                   stability: 4,
                   battleground: true,
                   vicinities_attributes: [region: Region.find_by(abbr: "ME")]
                  )
    create_country(name: "Iraq",
                   stability: 3,
                   battleground: true,
                   vicinities_attributes: [region: Region.find_by(abbr: "ME")]
                  )
    create_country(name: "Iran",
                   stability: 2,
                   battleground: true,
                   vicinities_attributes: [region: Region.find_by(abbr: "ME")]
                  )
    create_country(name: "Libya",
                   stability: 2,
                   battleground: true,
                   vicinities_attributes: [region: Region.find_by(abbr: "ME")]
                  )
    create_country(name: "Egypt",
                   stability: 2,
                   battleground: true,
                   vicinities_attributes: [region: Region.find_by(abbr: "ME")]
                  )
    create_country(name: "Jordan",
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "ME")]
                  )
    create_country(name: "Gulf States",
                   stability: 3,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "ME")]
                  )
    create_country(name: "Saudi Arabia",
                   stability: 3,
                   battleground: true,
                   vicinities_attributes: [region: Region.find_by(abbr: "ME")]
                  )

    # Asia
    create_country(name: "North Korea",
                   stability: 3,
                   battleground: true,
                   vicinities_attributes: [region: Region.find_by(abbr: "AS")]
                  )
    create_country(name: "Afghanistan",
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "AS")]
                  )
    create_country(name: "South Korea",
                   stability: 3,
                   battleground: true,
                   vicinities_attributes: [region: Region.find_by(abbr: "AS")]
                  )
    create_country(name: "Pakistan",
                   stability: 2,
                   battleground: true,
                   vicinities_attributes: [region: Region.find_by(abbr: "AS")]
                  )
    create_country(name: "Japan",
                   stability: 4,
                   battleground: true,
                   vicinities_attributes: [region: Region.find_by(abbr: "AS")]
                  )
    create_country(name: "India",
                   stability: 3,
                   battleground: true,
                   vicinities_attributes: [region: Region.find_by(abbr: "AS")]
                  )
    create_country(name: "Taiwan",
                   stability: 3,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "AS")]
                  )
    create_country(name: "Australia",
                   stability: 4,
                   battleground: false,
                   vicinities_attributes: [region: Region.find_by(abbr: "AS")]
                  )
    create_country(name: "Burma",
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "AS") },
                                           { region: Region.find_by(abbr: "SE") }
                                          ]
                  )
    create_country(name: "Laos/Cambodia",
                   stability: 1,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "AS") },
                                           { region: Region.find_by(abbr: "SE") }
                                          ]
                  )
    create_country(name: "Thailand",
                   stability: 2,
                   battleground: true,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "AS") },
                                           { region: Region.find_by(abbr: "SE") }
                                          ]
                  )
    create_country(name: "Vietnam",
                   stability: 1,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "AS") },
                                           { region: Region.find_by(abbr: "SE") }
                                          ]
                  )
    create_country(name: "Philippines",
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "AS") },
                                           { region: Region.find_by(abbr: "SE") }
                                          ]
                  )
    create_country(name: "Malaysia",
                   stability: 2,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "AS") },
                                           { region: Region.find_by(abbr: "SE") }
                                          ]
                  )
    create_country(name: "Indonesia",
                   stability: 1,
                   battleground: false,
                   vicinities_attributes: [{ region: Region.find_by(abbr: "AS") },
                                           { region: Region.find_by(abbr: "SE") }
                                          ]
                  )
    united_states      = Country.find_by(name: "United States")
    ussr               = Country.find_by(name: "USSR")

    mexico             = Country.find_by(name: "Mexico")
    cuba               = Country.find_by(name: "Cuba")
    guatemala          = Country.find_by(name: "Guatemala")
    el_salvador        = Country.find_by(name: "El Salvador")
    honduras           = Country.find_by(name: "Honduras")
    nicaragua          = Country.find_by(name: "Nicaragua")
    haiti              = Country.find_by(name: "Haiti")
    dominican_republic = Country.find_by(name: "Dominican Republic")
    costa_rica         = Country.find_by(name: "Costa Rica")
    panama             = Country.find_by(name: "Panama")

    venezuela          = Country.find_by(name: "Venezuela")
    ecuador            = Country.find_by(name: "Ecuador")
    columbia           = Country.find_by(name: "Columbia")
    peru               = Country.find_by(name: "Peru")
    brazil             = Country.find_by(name: "Brazil")
    bolivia            = Country.find_by(name: "Bolivia")
    chile              = Country.find_by(name: "Chile")
    paraguay           = Country.find_by(name: "Paraguay")
    argentina          = Country.find_by(name: "Argentina")
    uruguay            = Country.find_by(name: "Uruguay")

    norway             = Country.find_by(name: "Norway")
    denmark            = Country.find_by(name: "Denmark")
    sweden             = Country.find_by(name: "Sweden")
    united_kingdom     = Country.find_by(name: "United Kingdom")
    canada             = Country.find_by(name: "Canada")
    benelux            = Country.find_by(name: "Benelux")
    west_germany       = Country.find_by(name: "West Germany")
    france             = Country.find_by(name: "France")
    spain_portugal     = Country.find_by(name: "Spain/Portugal")
    italy              = Country.find_by(name: "Italy")
    turkey             = Country.find_by(name: "Turkey")
    greece             = Country.find_by(name: "Greece")
    finland            = Country.find_by(name: "Finland")
    austria            = Country.find_by(name: "Austria")

    east_germany       = Country.find_by(name: "East Germany")
    poland             = Country.find_by(name: "Poland")
    czech              = Country.find_by(name: "Czechoslovakia")
    hungary            = Country.find_by(name: "Hungary")
    romania            = Country.find_by(name: "Romania")
    yugoslavia         = Country.find_by(name: "Yugoslavia")
    bulgaria           = Country.find_by(name: "Bulgaria")

    morocco            = Country.find_by(name: "Morocco")
    algeria            = Country.find_by(name: "Algeria")
    tunisia            = Country.find_by(name: "Tunisia")
    west_africa        = Country.find_by(name: "West African States")
    saharan_states     = Country.find_by(name: "Saharan States")
    sudan              = Country.find_by(name: "Sudan")
    ivory_coast        = Country.find_by(name: "Ivory Coast")
    nigeria            = Country.find_by(name: "Nigeria")
    ethiopia           = Country.find_by(name: "Ethiopia")
    cameroon           = Country.find_by(name: "Cameroon")
    zaire              = Country.find_by(name: "Zaire")
    kenya              = Country.find_by(name: "Kenya")
    somalia            = Country.find_by(name: "Somalia")
    angola             = Country.find_by(name: "Angola")
    zimbabwe           = Country.find_by(name: "Zimbabwe")
    se_african_states  = Country.find_by(name: "SE African States")
    botswana           = Country.find_by(name: "Botswana")
    south_africa       = Country.find_by(name: "South Africa")

    lebanon            = Country.find_by(name: "Lebanon")
    syria              = Country.find_by(name: "Syria")
    israel             = Country.find_by(name: "Israel")
    iraq               = Country.find_by(name: "Iraq")
    iran               = Country.find_by(name: "Iran")
    libya              = Country.find_by(name: "Libya")
    egypt              = Country.find_by(name: "Egypt")
    jordan             = Country.find_by(name: "Jordan")
    gulf_states        = Country.find_by(name: "Gulf States")
    saudi_arabia       = Country.find_by(name: "Saudi Arabia")

    north_korea        = Country.find_by(name: "North Korea")
    afghanistan        = Country.find_by(name: "Afghanistan")
    south_korea        = Country.find_by(name: "South Korea")
    pakistan           = Country.find_by(name: "Pakistan")
    japan              = Country.find_by(name: "Japan")
    india              = Country.find_by(name: "India")
    taiwan             = Country.find_by(name: "Taiwan")
    australia          = Country.find_by(name: "Australia")
    burma              = Country.find_by(name: "Burma")
    laos_cambodia      = Country.find_by(name: "Laos/Cambodia")
    thailand           = Country.find_by(name: "Thailand")
    vietnam            = Country.find_by(name: "Vietnam")
    philippines        = Country.find_by(name: "Philippines")
    malaysia           = Country.find_by(name: "Malaysia")
    indonesia          = Country.find_by(name: "Indonesia")





    mexico.update!(connections_attributes: [{ neighbor: guatemala },
                                            { neighbor: united_states,
                                              superpower: true
                                            }
                                           ]
                  )
    cuba.update!(connections_attributes: [{ neighbor: nicaragua },
                                          { neighbor: haiti },
                                          { neighbor: united_states,
                                            superpower: true
                                          }
                                         ]
                )
    guatemala.update!(connections_attributes: [{ neighbor: mexico },
                                               { neighbor: el_salvador },
                                               { neighbor: honduras }
                                              ]
                     )
    el_salvador.update!(connections_attributes: [{ neighbor: guatemala },
                                                 { neighbor: honduras }
                                                ]
                       )
    honduras.update!(connections_attributes: [{ neighbor: guatemala },
                                              { neighbor: el_salvador },
                                              { neighbor: costa_rica },
                                              { neighbor: nicaragua }
                                             ]
                    )
    nicaragua.update!(connections_attributes: [{ neighbor: cuba },
                                               { neighbor: honduras },
                                               { neighbor: costa_rica }
                                              ]
                     )
    haiti.update!(connections_attributes: [{ neighbor: cuba },
                                           { neighbor: dominican_republic }
                                          ]
                 )
    dominican_republic.update!(connections_attributes: [{ neighbor: haiti }])
    costa_rica.update!(connections_attributes: [{ neighbor: panama },
                                                { neighbor: nicaragua },
                                                { neighbor: honduras }
                                               ]
                      )
    panama.update!(connections_attributes: [{ neighbor: costa_rica },
                                            { neighbor: columbia,
                                              inter_regional: true
                                            }
                                           ]
                  )
    venezuela.update!(connections_attributes: [{ neighbor: columbia },
                                               { neighbor: brazil }
                                              ]
                     )
    ecuador.update!(connections_attributes: [{ neighbor: columbia },
                                             { neighbor: peru }
                                            ]
                   )
    columbia.update!(connections_attributes: [{ neighbor: venezuela },
                                              { neighbor: ecuador },
                                              { neighbor: panama,
                                                inter_regional: true
                                              }
                                             ]
                    )
    peru.update!(connections_attributes: [{ neighbor: ecuador },
                                          { neighbor: bolivia },
                                          { neighbor: chile }
                                         ]
                )
    brazil.update!(connections_attributes: [{ neighbor: venezuela },
                                            { neighbor: uruguay }
                                           ]
                  )
    bolivia.update!(connections_attributes: [{ neighbor: peru },
                                             { neighbor: uruguay }
                                            ]
                   )
    chile.update!(connections_attributes: [{ neighbor: peru },
                                           { neighbor: argentina }
                                          ]
                 )
    paraguay.update!(connections_attributes: [{ neighbor: bolivia },
                                              { neighbor: uruguay },
                                              { neighbor: argentina }
                                             ]
                    )
    argentina.update!(connections_attributes: [{ neighbor: chile },
                                               { neighbor: paraguay },
                                               { neighbor: uruguay }
                                              ]
                     )
    uruguay.update!(connections_attributes: [{ neighbor: argentina },
                                             { neighbor: paraguay },
                                             { neighbor: brazil }
                                            ]
                   )
    norway.update!(connections_attributes: [{ neighbor: united_kingdom },
                                            { neighbor: sweden }
                                           ]
                  )
    denmark.update!(connections_attributes: [{ neighbor: sweden },
                                             { neighbor: west_germany }
                                            ]
                   )
    sweden.update!(connections_attributes: [{ neighbor: norway },
                                            { neighbor: denmark },
                                            { neighbor: finland }
                                           ]
                  )
    united_kingdom.update!(connections_attributes: [{ neighbor: norway },
                                                    { neighbor: france },
                                                    { neighbor: canada },
                                                    { neighbor: benelux }
      ])
    canada.update!(connections_attributes: [{ neighbor: united_kingdom },
                                            { neighbor: united_states,
                                              superpower: true
                                            }
      ])
    benelux.update!(connections_attributes: [{ neighbor: united_kingdom },
                                             { neighbor: west_germany }
      ])
    west_germany.update!(connections_attributes: [{ neighbor: denmark },
                                                  { neighbor: benelux },
                                                  { neighbor: france },
                                                  { neighbor: east_germany }
      ])
    france.update!(connections_attributes: [{ neighbor: united_kingdom },
                                            { neighbor: west_germany },
                                            { neighbor: spain_portugal },
                                            { neighbor: algeria,
                                              inter_regional: true
                                            },
                                            { neighbor: italy }
      ])
    spain_portugal.update!(connections_attributes: [{ neighbor: france },
                                                    { neighbor: italy },
                                                    { neighbor: morocco,
                                                      inter_regional: true
                                                    }
      ])
    italy.update!(connections_attributes: [{ neighbor: france },
                                           { neighbor: austria },
                                           { neighbor: yugoslavia },
                                           { neighbor: greece },
                                           { neighbor: spain_portugal }
      ])
    turkey.update!(connections_attributes: [{ neighbor: romania },
                                            { neighbor: bulgaria },
                                            { neighbor: greece },
                                            { neighbor: syria,
                                              inter_regional: true
                                            }
      ])
    greece.update!(connections_attributes: [{ neighbor: italy },
                                            { neighbor: yugoslavia },
                                            { neighbor: bulgaria },
                                            { neighbor: turkey }
      ])
    finland.update!(connections_attributes: [{ neighbor: sweden },
                                             { neighbor: ussr,
                                               superpower: true
                                             }
      ])
    austria.update!(connections_attributes: [{ neighbor: west_germany },
                                             { neighbor: east_germany },
                                             { neighbor: hungary },
                                             { neighbor: italy }
      ])

    east_germany.update!(connections_attributes: [{ neighbor: poland },
                                                  { neighbor: czech },
                                                  { neighbor: austria },
                                                  { neighbor: west_germany }
      ])
    poland.update!(connections_attributes: [{ neighbor: czech },
                                            { neighbor: east_germany },
                                            { neighbor: ussr,
                                              superpower: true
                                            }
      ])
    czech.update!(connections_attributes: [{ neighbor: east_germany },
                                           { neighbor: poland },
                                           { neighbor: hungary }
      ])
    hungary.update!(connections_attributes: [{ neighbor: austria },
                                             { neighbor: czech },
                                             { neighbor: yugoslavia },
                                             { neighbor: romania }
      ])
    romania.update!(connections_attributes: [{ neighbor: turkey },
                                             { neighbor: yugoslavia },
                                             { neighbor: hungary },
                                             { neighbor: ussr,
                                               superpower: true
                                             }
      ])
    yugoslavia.update!(connections_attributes: [{ neighbor: hungary },
                                                { neighbor: romania },
                                                { neighbor: greece },
                                                { neighbor: italy }
      ])
    bulgaria.update!(connections_attributes: [{ neighbor: turkey },
                                              { neighbor: greece }
      ])

    morocco.update!(connections_attributes: [{ neighbor: spain_portugal,
                                               inter_regional: true
                                             },
                                             { neighbor: algeria },
                                             { neighbor: west_africa }
      ])
    algeria.update!(connections_attributes: [{ neighbor: france,
                                               inter_regional: true
                                             },
                                             { neighbor: morocco },
                                             { neighbor: saharan_states },
                                             { neighbor: tunisia }
      ])
    tunisia.update!(connections_attributes: [{ neighbor: algeria },
                                             { neighbor: libya,
                                               inter_regional: true
                                             }
      ])
    west_africa.update!(connections_attributes: [{ neighbor: morocco },
                                                 { neighbor: ivory_coast }
      ])
    saharan_states.update!(connections_attributes: [{ neighbor: algeria },
                                                    { neighbor: nigeria }
      ])
    sudan.update!(connections_attributes: [{ neighbor: egypt,
                                             inter_regional: true },
                                           { neighbor: ethiopia }
      ])
    ivory_coast.update!(connections_attributes: [{ neighbor: west_africa },
                                                 { neighbor: nigeria }
      ])
    nigeria.update!(connections_attributes: [{ neighbor: saharan_states },
                                             { neighbor: ivory_coast },
                                             { neighbor: cameroon }
      ])
    ethiopia.update!(connections_attributes: [{ neighbor: sudan },
                                              { neighbor: somalia }
      ])
    cameroon.update!(connections_attributes: [{ neighbor: nigeria },
                                              { neighbor: zaire }
      ])
    zaire.update!(connections_attributes: [{ neighbor: cameroon },
                                           { neighbor: angola },
                                           { neighbor: zimbabwe }
      ])
    kenya.update!(connections_attributes: [{ neighbor: somalia },
                                           { neighbor: se_african_states }
      ])
    somalia.update!(connections_attributes: [{ neighbor: ethiopia },
                                             { neighbor: kenya }
      ])
    angola.update!(connections_attributes: [{ neighbor: zaire },
                                            { neighbor: botswana },
                                            { neighbor: south_africa }
      ])
    zimbabwe.update!(connections_attributes: [{ neighbor: zaire },
                                              { neighbor: botswana }
      ])
    se_african_states.update!(connections_attributes: [{ neighbor: kenya },
                                                       { neighbor: zimbabwe }
      ])
    botswana.update!(connections_attributes: [{ neighbor: zimbabwe },
                                              { neighbor: angola },
                                              { neighbor: south_africa }
      ])
    south_africa.update!(connections_attributes: [{ neighbor: angola },
                                                  { neighbor: botswana }
      ])

    lebanon.update!(connections_attributes: [ { neighbor: israel },
                                              { neighbor: jordan },
                                              { neighbor: syria }
                                            ]
                   )
    syria.update!(connections_attributes: [ { neighbor: israel },
                                            { neighbor: lebanon },
                                            { neighbor: turkey,
                                              inter_regional: true
                                            }
                                          ]
                 )
    israel.update!(connections_attributes: [ { neighbor: egypt },
                                             { neighbor: jordan },
                                             { neighbor: syria },
                                             { neighbor: lebanon }
                                           ]
                  )
    iraq.update!(connections_attributes: [ { neighbor: iran },
                                              { neighbor: gulf_states },
                                              { neighbor: saudi_arabia },
                                              { neighbor: lebanon }
                                            ]
                   )
    iran.update!(connections_attributes: [ { neighbor: afghanistan,
                                             inter_regional: true
                                           },
                                              { neighbor: pakistan,
                                                inter_regional: true
                                              },
                                              { neighbor: iraq }
                                            ]
                   )
    libya.update!(connections_attributes: [ { neighbor: egypt },
                                            { neighbor: tunisia,
                                              inter_regional: true
                                            }
                                          ]
                 )
    egypt.update!(connections_attributes: [ { neighbor: israel },
                                            { neighbor: sudan,
                                              inter_regional: true
                                            },
                                            { neighbor: tunisia }
                                          ]
                 )
    jordan.update!(connections_attributes: [ { neighbor: saudi_arabia },
                                              { neighbor: iraq },
                                              { neighbor: lebanon },
                                              { neighbor: israel }
                                            ]
                   )
    gulf_states.update!(connections_attributes: [ { neighbor: iraq },
                                              { neighbor: saudi_arabia }
                                            ]
                   )
    saudi_arabia.update!(connections_attributes: [ { neighbor: gulf_states },
                                              { neighbor: iraq },
                                              { neighbor: jordan }
                                            ]
                   )


    north_korea.update!(connections_attributes: [{ neighbor: south_korea },
                                                 { neighbor: ussr,
                                                   superpower: true
                                                 }
      ])
    afghanistan.update!(connections_attributes: [{ neighbor: iran,
                                                   inter_regional: true
                                                 },
                                                 { neighbor: pakistan },
                                                 { neighbor: ussr,
                                                   superpower: true
                                                 }
      ])
    south_korea.update!(connections_attributes: [{ neighbor: north_korea },
                                                 { neighbor: japan },
                                                 { neighbor: taiwan }
      ])
    pakistan.update!(connections_attributes: [{ neighbor: india },
                                              { neighbor: afghanistan },
                                              { neighbor: iran,
                                                inter_regional: true
                                              }
      ])
    japan.update!(connections_attributes: [{ neighbor: philippines },
                                           { neighbor: taiwan },
                                           { neighbor: south_korea },
                                           { neighbor: united_states,
                                             superpower: true
                                           }
      ])
    india.update!(connections_attributes: [{ neighbor: burma },
                                           { neighbor: pakistan }
      ])
    taiwan.update!(connections_attributes: [{ neighbor: south_korea },
                                            { neighbor: japan }
      ])
    australia.update!(connections_attributes: [{ neighbor: malaysia }
      ])
    burma.update!(connections_attributes: [{ neighbor: laos_cambodia },
                                           { neighbor: india }
      ])
    laos_cambodia.update!(connections_attributes: [{ neighbor: burma },
                                                   { neighbor: vietnam },
                                                   { neighbor: thailand }
      ])
    thailand.update!(connections_attributes: [{ neighbor: malaysia },
                                              { neighbor: vietnam },
                                              { neighbor: laos_cambodia }
      ])
    vietnam.update!(connections_attributes: [{ neighbor: thailand },
                                             { neighbor: laos_cambodia }
      ])
    philippines.update!(connections_attributes: [{ neighbor: japan },
                                                 { neighbor: indonesia }
      ])
    malaysia.update!(connections_attributes: [{ neighbor: australia },
                                              { neighbor: indonesia },
                                              { neighbor: thailand }
      ])
    indonesia.update!(connections_attributes: [{ neighbor: philippines },
                                               { neighbor: malaysia }
      ])
  end

  puts 'sample data was added successfully'
end

def create_user( options = {} )
  user_attributes = { email: 'sam@example.com',
                      password: 'welcome',
                      first_name: "Sam",
                      last_name: "Smith",
                      role: "super_admin" }
  attributes = user_attributes.merge options
  User.create! attributes
end

def create_country(options={})
  country_attributes = { }
  attributes         = country_attributes.merge(options)
  Country.create!(attributes)
end

def create_region(options={})
  region_attributes = { }
  attributes        = region_attributes.merge(options)
  Region.create!(attributes)
end
