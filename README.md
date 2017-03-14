# olin-text-script
Text people to remind them to donate to their alma mater.

## Usage
- Create a Twilio account
- Fund your Twilio account with $
- Create a CSV of the people you want to text. Look at `sample-contacts.csv` for an example
- `CONTACTS_LIST=<...> FROM_NUMBER='+123...' ACCOUNT_SID=<...> AUTH_TOKEN=<...> bundle exec ruby texter.rb`
  - `CONTACTS_LIST` is the filepath to the CSV of people to bother
  - `FROM_NUMBER`, `ACCOUNT_SID` and `AUTH_TOKEN` all come from your Twilio account

