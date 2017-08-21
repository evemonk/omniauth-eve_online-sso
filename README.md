# OmniAuth EveOnline SSO

Eve Online OAuth2 Strategy for OmniAuth.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-eve_online-sso'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-eve_online-sso

## Usage

Configure omniauth for use new strategy:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :eve_online_sso, ENV['EVE_ONLINE_SSO_CLIENT_ID'], ENV['EVE_ONLINE_SSO_SECRET_KEY'], scope: 'publicData'
end
```

## Scopes

Scopes can be one of two types. Old CREST or new ESI. ESI is recommended for all new apps.

### ESI

|Scope|Description|
|-----|-----------|
|esi-assets.read_assets.v1|Allows reading a list of assets that the character owns.|
|esi-bookmarks.read_character_bookmarks.v1|Allows reading of a character's bookmarks and bookmark folders.|
|esi-calendar.read_calendar_events.v1|Allows reading a character's calendar, including corporation events.|
|esi-calendar.respond_calendar_events.v1|Allows updating of a character's calendar event responses.|
|esi-characters.read_agents_research.v1|Allows reading a character's research status with agents.|
|esi-characters.read_blueprints.v1|Allows reading a character's blueprints.|
|esi-characters.read_chat_channels.v1|Allows reading a character's chat channels.|
|esi-characters.read_contacts.v1|Allows reading of a characters contacts list, and calculation of CSPA charges.|
|esi-characters.read_corporation_roles.v1|Allows reading the character's corporation roles.|
|esi-characters.read_fatigue.v1|Allows reading a character's jump fatigue information.|
|esi-characters.read_loyalty.v1|Allows reading a character's loyalty points.|
|esi-characters.read_medals.v1|Allows reading a character's medals.|
|esi-characters.read_opportunities.v1|Allows reading opportunities of a character.|
|esi-characters.read_standings.v1|Allows reading a character's standings.|
|esi-characters.write_contacts.v1|Allows management of contacts.|
|esi-clones.read_clones.v1|Allows reading the locations of a character's jump clones and their implants.|
|esi-clones.read_implants.v1|Allows reading a character's active clone's implants.|
|esi-contracts.read_character_contracts.v1|Allows reading a character's contracts.|
|esi-corporations.read_corporation_membership.v1|Allows reading a list of the ID's and roles of a character's fellow corporation members.|
|esi-corporations.read_structures.v1|Allows reading a character's corporation's structure information.|
|esi-corporations.write_structures.v1: Allows updating a character's corporation's structure information.|
|esi-fittings.read_fittings.v1|Allows reading information about fittings.|
|esi-fittings.write_fittings.v1|Allows manipulating fittings.|
|esi-fleets.read_fleet.v1|Allows reading information about fleets.|
|esi-fleets.write_fleet.v1|Allows manipulating fleets.|
|esi-industry.read_character_jobs.v1|Allows reading a character's industry jobs.|
|esi-killmails.read_corporation_killmails.v1|Allows reading of a corporation's kills and losses.|
|esi-killmails.read_killmails.v1|Allows reading of a character's kills and losses.|
|esi-location.read_location.v1|Allows reading of a character's active ship location.|
|esi-location.read_online.v1|Allows reading a character's online status.|
|esi-location.read_ship_type.v1|Allows reading of a character's active ship class.|
|esi-mail.organize_mail.v1|Allows updating the character's mail labels and unread status. Also allows deleting of the character's mail.|
|esi-mail.read_mail.v1|Allows reading of the character's inbox and mails.|
|esi-mail.send_mail.v1|Allows sending of mail on the character's behalf.|
|esi-markets.read_character_orders.v1|Allows reading a character's market orders.|
|esi-markets.structure_markets.v1|Allows reading market data from a structure, if the user has market access to that structure.|
|esi-planets.manage_planets.v1|Allows reading a list of a characters planetary colonies, and the details of those colonies.|
|esi-search.search_structures.v1|Allows searching over all structures that a character can see in the structure browser.|
|esi-skills.read_skillqueue.v1|Allows reading of a character's currently training skill queue.|
|esi-skills.read_skills.v1|Allows reading of a character's currently known skills.|
|esi-ui.open_window.v1|Allows open window in game client remotely.|
|esi-ui.write_waypoint.v1|Allows manipulating waypoints in game client remotely.|
|esi-universe.read_structures.v1|Allows querying the location and type of structures that the character has docking access at.|
|esi-wallet.read_character_wallet.v1|Allows reading of a character's wallet, journal and transaction history.|

### CREST

|Scope|Description|
|-----|-----------|
|characterAccountRead|Read your account subscription status.|
|characterAssetsRead|Read your asset list.|
|characterBookmarksRead|List your bookmarks and their coordinates.|
|characterCalendarRead|Read your calendar events and attendees.|
|characterChatChannelsRead|List chat channels you own or operate.|
|characterClonesRead|List your jump clones, implants, attributes, and jump fatigue timer.|
|characterContactsRead|Allows access to reading your characters contacts.|
|characterContactsWrite|Allows applications to add, modify, and delete contacts for your character.|
|characterContractsRead|Read your contracts.|
|characterFactionalWarfareRead|Read your factional warfare statistics.|
|characterFittingsRead|Allows an application to view all of your character's saved fits.|
|characterFittingsWrite|Allows an application to create and delete the saved fits for your character.|
|characterIndustryJobsRead|List your industry jobs.|
|characterKillsRead|Read your kill mails.|
|characterLocationRead|Allows an application to read your characters real time location in EVE.|
|characterLoyaltyPointsRead|List loyalty points your character has for the different corporations.|
|characterMailRead|Read your EVE Mail.|
|characterMarketOrdersRead|Read your market orders.|
|characterMedalsRead|List your public and private medals.|
|characterNavigationWrite|Allows an application to set your ships autopilot destination.|
|characterNotificationsRead|Receive in-game notifications.|
|characterOpportunitiesRead|List the opportunities your character has completed.|
|characterResearchRead|List your research agents working for you and research progress.|
|characterSkillsRead|Read your skills and skill queue.|
|characterStatsRead|Yearly aggregated stats about your character.|
|characterWalletRead|Read your wallet status, transaction, and journal history.|
|corporationAssetsRead|Read your corporation's asset list.|
|corporationBookmarksRead|List your corporation's bookmarks and their coordinates.|
|corporationContactsRead|Read your corporation’s contact list and standings.|
|corporationContractsRead|List your corporation's contracts.|
|corporationFactionalWarfareRead|Read your corporation's factional warfare statistics.|
|corporationIndustryJobsRead|List your corporation's industry jobs.|
|corporationKillsRead|Read your corporation's kill mails.|
|corporationMarketOrdersRead|List your corporation's market orders.|
|corporationMedalsRead|List your corporation's issued medals.|
|corporationMembersRead|List your corporation's members, their titles, and roles.|
|corporationShareholdersRead|List your corporation's shareholders and their shares.|
|corporationStructuresRead|List your corporation's structures, outposts, and starbases.|
|corporationWalletRead|Read your corporation's wallet status, transaction, and journal history.|
|fleetRead|Allows real time reading of your fleet information (members, ship types, etc.) if you're the boss of the fleet.|
|fleetWrite|Allows the ability to invite, kick, and update fleet information if you're the boss of the fleet.|
|publicData|Allows access to public data.|
|remoteClientUI|Allows applications to control the UI of your EVE Online client.|
|structureVulnUpdate|Allows updating your structures' vulnerability timers.|

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/biow0lf/omniauth-eve_online-sso.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
