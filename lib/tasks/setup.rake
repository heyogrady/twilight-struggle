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

  Card.transaction do
    create_card(name: "AsiaScoring",
                card_number: 1,
                title: "Asia Scoring",
                description: "",
                phase: :early,
                ops_points: 0,
                side: nil
               )
    create_card(name: "EuropeScoring",
                card_number: 2,
                title: "Europe Scoring",
                description: "",
                phase: :early,
                ops_points: 0,
                side: nil
               )
    create_card(name: "MiddleEastScoring",
                card_number: 3,
                title: "Middle East Scoring",
                description: "",
                phase: :early,
                ops_points: 0,
                side: nil
               )
    create_card(name: "DuckAndCover",
                card_number: 4,
                title: "Duck and Cover",
                description: "",
                phase: :early,
                ops_points: 3,
                side: "US"
               )
    create_card(name: "FiveYearPlan",
                card_number: 5,
                title: "Five Year Plan",
                description: "",
                phase: :early,
                ops_points: 3,
                side: "US"
               )
    create_card(name: "TheChinaCard",
                card_number: 6,
                title: "The China Card",
                description: "",
                phase: :early,
                ops_points: 4,
                side: nil
               )
    create_card(name: "SocialistGovernments",
                card_number: 7,
                title: "Socialist Governments",
                description: "",
                phase: :early,
                ops_points: 3,
                side: "USSR"
               )
    create_card(name: "Fidel",
                card_number: 8,
                title: "Fidel",
                description: "",
                phase: :early,
                ops_points: 2,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "VietnamRevolts",
                card_number: 9,
                title: "Vietnam Revolts",
                description: "",
                phase: :early,
                ops_points: 2,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "Blockade",
                card_number: 10,
                title: "Blockade",
                description: "",
                phase: :early,
                ops_points: 1,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "KoreanWar",
                card_number: 11,
                title: "Korean War",
                description: "",
                phase: :early,
                ops_points: 2,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "RomanianAbdication",
                card_number: 12,
                title: "Romanian Abdication",
                description: "",
                phase: :early,
                ops_points: 1,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "ArabIsraeliWar",
                card_number: 13,
                title: "Arab-Israeli War",
                description: "",
                phase: :early,
                ops_points: 2,
                side: "USSR"
               )
    create_card(name: "Comecon",
                card_number: 14,
                title: "Comecon",
                description: "",
                phase: :early,
                ops_points: 3,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "Nasser",
                card_number: 15,
                title: "Nasser",
                description: "",
                phase: :early,
                ops_points: 1,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "WarsawPactFormed",
                card_number: 16,
                title: "Warsaw Pact Formed",
                description: "",
                phase: :early,
                ops_points: 3,
                side: "USSR",
                remove_after_event: true,
                display_after_event: true
               )
    create_card(name: "DeGaulleLeadsFrance",
                card_number: 17,
                title: "De Gaulle Leads France",
                description: "",
                phase: :early,
                ops_points: 3,
                side: "USSR",
                remove_after_event: true,
                display_after_event: true
               )
    create_card(name: "CapturedNaziScientist",
                card_number: 18,
                title: "Captured Nazi Scientist",
                description: "",
                phase: :early,
                ops_points: 1,
                side: nil,
                remove_after_event: true
               )
    create_card(name: "TrumanDoctrine",
                card_number: 19,
                title: "Truman Doctrine",
                description: "",
                phase: :early,
                ops_points: 1,
                side: "US",
                remove_after_event: true
               )
    create_card(name: "OlympicGames",
                card_number: 20,
                title: "Olympic Games",
                description: "",
                phase: :early,
                ops_points: 2,
                side: nil
               )
    create_card(name: "Nato",
                card_number: 21,
                title: "NATO",
                description: "",
                phase: :early,
                ops_points: 4,
                side: "US",
                remove_after_event: true,
                display_after_event: true
               )
    create_card(name: "IndependentReds",
                card_number: 22,
                title: "Independent Reds",
                description: "",
                phase: :early,
                ops_points: 2,
                side: "US",
                remove_after_event: true
               )
    create_card(name: "MarshallPlan",
                card_number: 23,
                title: "Marshall Plan",
                description: "",
                phase: :early,
                ops_points: 4,
                side: "US",
                remove_after_event: true,
                display_after_event: true
               )
    create_card(name: "IndoPakistaniWar",
                card_number: 24,
                title: "Indo-Pakistani War",
                description: "",
                phase: :early,
                ops_points: 2,
                side: nil
               )
    create_card(name: "Containment",
                card_number: 25,
                title: "Containment",
                description: "",
                phase: :early,
                ops_points: 3,
                side: "US",
                remove_after_event: true
               )
    create_card(name: "CiaCreated",
                card_number: 26,
                title: "CIA Created",
                description: "",
                phase: :early,
                ops_points: 1,
                side: "US",
                remove_after_event: true
               )
    create_card(name: "UsJapanMutualDefensePact",
                card_number: 27,
                title: "US/Japan Mutual Defense Pact",
                description: "",
                phase: :early,
                ops_points: 4,
                side: "US",
                remove_after_event: true,
                display_after_event: true
               )
    create_card(name: "SuezCrisis",
                card_number: 28,
                title: "Suez Crisis",
                description: "",
                phase: :early,
                ops_points: 3,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "EastEuropeanUnrest",
                card_number: 29,
                title: "East European Unrest",
                description: "",
                phase: :early,
                ops_points: 3,
                side: "US"
               )
    create_card(name: "Decolonization",
                card_number: 30,
                title: "Decolonization",
                description: "",
                phase: :early,
                ops_points: 2,
                side: "USSR"
               )
    create_card(name: "RedScarePurge",
                card_number: 31,
                title: "Red Scare/Purge",
                description: "",
                phase: :early,
                ops_points: 4,
                side: nil
               )
    create_card(name: "UnIntervention",
                card_number: 32,
                title: "UN Intervention",
                description: "",
                phase: :early,
                ops_points: 1,
                side: nil,
                prevent_in_headline: true
               )
    create_card(name: "DeStalinization",
                card_number: 33,
                title: "De-Stalinization",
                description: "",
                phase: :early,
                ops_points: 3,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "NuclearTestBan",
                card_number: 34,
                title: "Nuclear Test Ban",
                description: "",
                phase: :early,
                ops_points: 4,
                side: nil
               )
    create_card(name: "FormosanResolution",
                card_number: 35,
                title: "Formosan Resolution",
                description: "",
                phase: :early,
                ops_points: 2,
                side: "US",
                remove_after_event: true,
                display_after_event: true
               )
    create_card(name: "Defectors",
                card_number: 103,
                title: "Defectors",
                description: "",
                phase: :early,
                ops_points: 2,
                side: "US",
                always_evaluate_first: true # for headlines only
               )
    create_card(name: "BrushWar",
                card_number: 36,
                title: "Brush War",
                description: "",
                phase: :mid,
                ops_points: 3,
                side: nil
               )
    create_card(name: "CentralAmericaScoring",
                card_number: 37,
                title: "Central America Scoring",
                description: "",
                phase: :mid,
                ops_points: 0,
                side: nil
               )
    create_card(name: "SoutheastAsiaScoring",
                card_number: 38,
                title: "Southeast Asia Scoring",
                description: "",
                phase: :mid,
                ops_points: 0,
                side: nil,
                remove_after_event: true
               )
    create_card(name: "ArmsRace",
                card_number: 39,
                title: "Arms Race",
                description: "",
                phase: :mid,
                ops_points: 3,
                side: nil
               )
    create_card(name: "CubanMissileCrisis",
                card_number: 40,
                title: "Cuban Missile Crisis",
                description: "",
                phase: :mid,
                ops_points: 3,
                side: nil,
                remove_after_event: true
               )
    create_card(name: "NuclearSubs",
                card_number: 41,
                title: "Nuclear Subs",
                description: "",
                phase: :mid,
                ops_points: 2,
                side: "US",
                remove_after_event: true
               )
    create_card(name: "Quagmire",
                card_number: 42,
                title: "Quagmire",
                description: "",
                phase: :mid,
                ops_points: 3,
                side: "USSR",
                remove_after_event: true,
                display_after_event: true
               )
    create_card(name: "SaltNegotiations",
                card_number: 43,
                title: "SALT Negotiations",
                description: "",
                phase: :mid,
                ops_points: 3,
                side: nil,
                remove_after_event: true
               )
    create_card(name: "BearTrap",
                card_number: 44,
                title: "Bear Trap",
                description: "",
                phase: :mid,
                ops_points: 3,
                side: "US",
                remove_after_event: true,
                display_after_event: true
               )
    create_card(name: "Summit",
                card_number: 45,
                title: "Summit",
                description: "",
                phase: :mid,
                ops_points: 1,
                side: nil
               )
    create_card(name: "HowILearnedToStopWorrying",
                card_number: 46,
                title: "How I Learned to Stop Worrying",
                description: "",
                phase: :mid,
                ops_points: 2,
                side: nil,
                remove_after_event: true
               )
    create_card(name: "Junta",
                card_number: 47,
                title: "Junta",
                description: "",
                phase: :mid,
                ops_points: 2,
                side: nil
               )
    create_card(name: "KitchenDebates",
                card_number: 48,
                title: "Kitchen Debates",
                description: "",
                phase: :mid,
                ops_points: 1,
                side: "US",
                remove_after_event: true
               )
    create_card(name: "MissileEnvy",
                card_number: 49,
                title: "Missile Envy",
                description: "",
                phase: :mid,
                ops_points: 2,
                side: nil
               )
    create_card(name: "WeWillBuryYou",
                card_number: 50,
                title: "“We Will Bury You”",
                description: "",
                phase: :mid,
                ops_points: 4,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "BrezhnevDoctrine",
                card_number: 51,
                title: "Brezhnev Doctrine",
                description: "",
                phase: :mid,
                ops_points: 3,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "PortugueseEmpireCrumbles",
                card_number: 52,
                title: "Portuguese Empire Crumbles",
                description: "",
                phase: :mid,
                ops_points: 2,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "SouthAfricanUnrest",
                card_number: 53,
                title: "South African Unrest",
                description: "",
                phase: :mid,
                ops_points: 2,
                side: "USSR"
               )
    create_card(name: "Allende",
                card_number: 54,
                title: "Allende",
                description: "",
                phase: :mid,
                ops_points: 1,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "WillyBrandt",
                card_number: 55,
                title: "Willy Brandt",
                description: "",
                phase: :mid,
                ops_points: 2,
                side: "USSR",
                remove_after_event: true,
                display_after_event: true
               )
    create_card(name: "MuslimRevolution",
                card_number: 56,
                title: "Muslim Revolution",
                description: "",
                phase: :mid,
                ops_points: 4,
                side: "USSR"
               )
    create_card(name: "AbmTreaty",
                card_number: 57,
                title: "ABM Treaty",
                description: "",
                phase: :mid,
                ops_points: 4,
                side: nil
               )
    create_card(name: "CulturalRevolution",
                card_number: 58,
                title: "Cultural Revolution",
                description: "",
                phase: :mid,
                ops_points: 3,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "FlowerPower",
                card_number: 59,
                title: "Flower Power",
                description: "",
                phase: :mid,
                ops_points: 4,
                side: "USSR",
                remove_after_event: true,
                display_after_event: true
               )
    create_card(name: "U2Incident",
                card_number: 60,
                title: "U2 Incident",
                description: "",
                phase: :mid,
                ops_points: 3,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "Opec",
                card_number: 61,
                title: "OPEC",
                description: "",
                phase: :mid,
                ops_points: 3,
                side: "USSR"
               )
    create_card(name: "LoneGunman",
                card_number: 62,
                title: "“Lone Gunman”",
                description: "",
                phase: :mid,
                ops_points: 1,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "ColonialRearGuards",
                card_number: 63,
                title: "Colonial Rear Guards",
                description: "",
                phase: :mid,
                ops_points: 2,
                side: "US"
               )
    create_card(name: "PanamaCanalReturned",
                card_number: 64,
                title: "Panama Canal Returned",
                description: "",
                phase: :mid,
                ops_points: 1,
                side: "US",
                remove_after_event: true
               )
    create_card(name: "CampDavidAccords",
                card_number: 65,
                title: "Camp David Accords",
                description: "",
                phase: :mid,
                ops_points: 2,
                side: "US",
                remove_after_event: true,
                display_after_event: true
               )
    create_card(name: "PuppetGovernments",
                card_number: 66,
                title: "Puppet Governments",
                description: "",
                phase: :mid,
                ops_points: 2,
                side: "US",
                remove_after_event: true
               )
    create_card(name: "GrainSalesToSoviets",
                card_number: 67,
                title: "Grain Sales to Soviets",
                description: "",
                phase: :mid,
                ops_points: 2,
                side: "US"
               )
    create_card(name: "JohnPaulIiElectedPope",
                card_number: 68,
                title: "John Paul II Elected Pope",
                description: "",
                phase: :mid,
                ops_points: 2,
                side: "US",
                remove_after_event: true,
                display_after_event: true
               )
    create_card(name: "LatinAmericanDeathSquads",
                card_number: 69,
                title: "Latin American Death Squads",
                description: "",
                phase: :mid,
                ops_points: 2,
                side: nil
               )
    create_card(name: "OasFounded",
                card_number: 70,
                title: "OAS Founded",
                description: "",
                phase: :mid,
                ops_points: 1,
                side: "US",
                remove_after_event: true
               )
    create_card(name: "NixonPlaysTheChinaCard",
                card_number: 71,
                title: "Nixon Plays the China Card",
                description: "",
                phase: :mid,
                ops_points: 2,
                side: "US",
                remove_after_event: true
               )
    create_card(name: "SadatExpelsSoviets",
                card_number: 72,
                title: "Sadat Expels Soviets",
                description: "",
                phase: :mid,
                ops_points: 1,
                side: "US",
                remove_after_event: true
               )
    create_card(name: "ShuttleDiplomacy",
                card_number: 73,
                title: "Shuttle Diplomacy",
                description: "",
                phase: :mid,
                ops_points: 3,
                side: "US",
                display_after_event: true
               )
    create_card(name: "TheVoiceOfAmerica",
                card_number: 74,
                title: "The Voice of America",
                description: "",
                phase: :mid,
                ops_points: 2,
                side: "US"
               )
    create_card(name: "LiberationTheology",
                card_number: 75,
                title: "Liberation Theology",
                description: "",
                phase: :mid,
                ops_points: 2,
                side: "USSR"
               )
    create_card(name: "UssuriRiverSkirmish",
                card_number: 76,
                title: "Ussuri River Skirmish",
                description: "",
                phase: :mid,
                ops_points: 3,
                side: "US",
                remove_after_event: true
               )
    create_card(name: "AskNotWhatYourCountry",
                card_number: 77,
                title: "“Ask Not What Your Country…”",
                description: "",
                phase: :mid,
                ops_points: 3,
                side: "US",
                remove_after_event: true
               )
    create_card(name: "AllianceForProgress",
                card_number: 78,
                title: "Alliance for Progress",
                description: "",
                phase: :mid,
                ops_points: 3,
                side: "US",
                remove_after_event: true
               )
    create_card(name: "AfricaScoring",
                card_number: 79,
                title: "Africa Scoring",
                description: "",
                phase: :mid,
                ops_points: 0,
                side: nil
               )
    create_card(name: "OneSmallStep",
                card_number: 80,
                title: "“One Small Step…”",
                description: "",
                phase: :mid,
                ops_points: 2,
                side: nil
               )
    create_card(name: "SouthAmericaScoring",
                card_number: 81,
                title: "South America Scoring",
                description: "",
                phase: :mid,
                ops_points: 0,
                side: nil
               )
    create_card(name: "IranianHostageCrisis",
                card_number: 82,
                title: "Iranian Hostage Crisis",
                description: "",
                phase: :late,
                ops_points: 3,
                side: "USSR",
                remove_after_event: true,
                display_after_event: true
               )
    create_card(name: "TheIronLady",
                card_number: 83,
                title: "The Iron Lady",
                description: "",
                phase: :late,
                ops_points: 3,
                side: "US",
                remove_after_event: true,
                display_after_event: true
               )
    create_card(name: "ReaganBombsLibya",
                card_number: 84,
                title: "Reagan Bombs Libya",
                description: "",
                phase: :late,
                ops_points: 2,
                side: "US",
                remove_after_event: true
               )
    create_card(name: "StarWars",
                card_number: 85,
                title: "Star Wars",
                description: "",
                phase: :late,
                ops_points: 2,
                side: "US",
                remove_after_event: true
               )
    create_card(name: "NorthSeaOil",
                card_number: 86,
                title: "North Sea Oil",
                description: "",
                phase: :late,
                ops_points: 3,
                side: "US",
                remove_after_event: true,
                display_after_event: true
               )
    create_card(name: "TheReformer",
                card_number: 87,
                title: "The Reformer",
                description: "",
                phase: :late,
                ops_points: 3,
                side: "USSR",
                remove_after_event: true,
                display_after_event: true
               )
    create_card(name: "MarineBarracksBombing",
                card_number: 88,
                title: "Marine Barracks Bombing",
                description: "",
                phase: :late,
                ops_points: 2,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "SovietsShootDownKal007",
                card_number: 89,
                title: "Soviets Shoot Down KAL-007",
                description: "",
                phase: :late,
                ops_points: 4,
                side: "US",
                remove_after_event: true
               )
    create_card(name: "Glasnost",
                card_number: 90,
                title: "Glasnost",
                description: "",
                phase: :late,
                ops_points: 4,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "OrtegaElectedInNicaragua",
                card_number: 91,
                title: "Ortega Elected in Nicaragua",
                description: "",
                phase: :late,
                ops_points: 2,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "Terrorism",
                card_number: 92,
                title: "Terrorism",
                description: "",
                phase: :late,
                ops_points: 2,
                side: nil
               )
    create_card(name: "IranContraScandal",
                card_number: 93,
                title: "Iran-Contra Scandal",
                description: "",
                phase: :late,
                ops_points: 2,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "Chernobyl",
                card_number: 94,
                title: "Chernobyl",
                description: "",
                phase: :late,
                ops_points: 3,
                side: "US",
                remove_after_event: true
               )
    create_card(name: "LatinAmericanDebtCrisis",
                card_number: 95,
                title: "Latin American Debt Crisis",
                description: "",
                phase: :late,
                ops_points: 2,
                side: "USSR"
               )
    create_card(name: "TearDownThisWall",
                card_number: 96,
                title: "Tear Down this Wall",
                description: "",
                phase: :late,
                ops_points: 3,
                side: "US",
                remove_after_event: true,
                display_after_event: true
               )
    create_card(name: "AnEvilEmpire",
                card_number: 97,
                title: "An Evil Empire",
                description: "",
                phase: :late,
                ops_points: 3,
                side: "US",
                remove_after_event: true,
                display_after_event: true
               )
    create_card(name: "AldrichAmesRemix",
                card_number: 98,
                title: "Aldrich Ames Remix",
                description: "",
                phase: :late,
                ops_points: 3,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "PershingIiDeployed",
                card_number: 99,
                title: "Pershing II Deployed",
                description: "",
                phase: :late,
                ops_points: 3,
                side: "USSR",
                remove_after_event: true
               )
    create_card(name: "Wargames",
                card_number: 100,
                title: "Wargames",
                description: "",
                phase: :late,
                ops_points: 4,
                side: nil,
                remove_after_event: true
               )
    create_card(name: "Solidarity",
                card_number: 101,
                title: "Solidarity",
                description: "",
                phase: :late,
                ops_points: 2,
                side: "US",
                remove_after_event: true
               )
    create_card(name: "IranIraqWar",
                card_number: 102,
                title: "Iran-Iraq War",
                description: "",
                phase: :late,
                ops_points: 2,
                side: nil,
                remove_after_event: true
               )
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

def create_card(options={})
  card_attributes = { }
  attributes        = card_attributes.merge(options)
  Card.create!(attributes)
end
