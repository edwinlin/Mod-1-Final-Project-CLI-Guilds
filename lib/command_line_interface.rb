def welcome

w_color = "#cd3232"

puts "  (`\\ .-') /`   ('-.                                  _   .-')       ('-. "
puts "   `.( OO ),' _(  OO)                                ( '.( OO )\_   _(  OO)"
puts ",--./  .--.  (,------.,--.       .-----.  .-'),-----. ,--.   ,--.)(,------."
puts "|      |  |   |  .---'|  |.-')  '  .--./ ( OO'  .-.  '|   `.'   |  |  .---'"
puts "|  |   |  |,  |  |    |  | OO ) |  |('-. /   |  | |  ||         |  |  |    "
puts "|  |.'.|  |_)(|  '--. |  |`-' |/_) |OO  )\\_) |  | |  ||  |'.'|  | (|  '--. "
puts Rainbow("|         |   |  .--'").color(w_color) + "(" + Rainbow("|  '---." + "'|" + "|  |`-'|   \\ |  | |  ||  |   |  |  |  .--' ").color(w_color)
puts Rainbow("|   ,'.   |   |  `---.|      |").color(w_color) + "(_" + Rainbow("'  '--'\\    `'  '-'  '|  |   |  |  |  `---.").color(w_color)
puts Rainbow("'--'   '--'   `------'`------'   `-----'      `-----' `--'   `--'  `------'").color(w_color)

end

def get_user_name(prompt)
  prompt.ask(Rainbow("Please enter your username:").teal) do |q|
    q.required true
    q.modify :trim
    q.messages[:required?] = Rainbow("No username provided").red
  end
end

#Returns user instance from db or creates one if it doesn't exist
def get_user_from_db(user)
  User.find_or_create_by(name: user)
  # if user_from_db.characters.count <= 0
  #   create_character_prompt(prompt, user_from_db)
  # end
end

#Gets user choice from menu
def get_user_action(prompt, user)
  prompt.say("Hi, #{user.name}!")
  choices = [
    {"Create a Character" => -> do create_character_prompt(prompt, user) end},
    {"Select a Character" => -> do user.characters.count > 0 ? select_user_character(prompt, user) : create_character_prompt(prompt,user) end},
    {"Exit" => -> do exit end}
  ]
  prompt.select(Rainbow("What do you want to do?").teal, choices)
end

#Create character
def create_character_prompt(prompt, user)
  char_name = prompt.ask(Rainbow("What is your character's name?").teal) do |q|
    q.required true
    q.messages[:required?] = Rainbow("Please enter a name").red
  end
  user.create_champ(char_name)
end

#Displays a list of characters to choose from
def select_user_character(prompt, user)
  choices = user.characters.map {|c|
    {
      name: c.name,
      value: c
    }
  }
  prompt.select(Rainbow("Select a character:").teal, choices, cycle: true)
end

#Executes user choice
# def do_user_action(prompt, user, choice)
#   case choice
#   when 1
#     create_character_prompt(prompt, user)
#     prompt.say(Rainbow("Character Created!").green.bright)
#     select_user_character(prompt, user)
#   when 2
#     select_user_character(prompt, user)
#   else
#     puts "Invalid option"
#   end
# end

#Displays character information
def display_character_info(character)
  table = Terminal::Table.new :title => Rainbow(character.name).color("#1464dc").bright do |t|
    t.add_row [Rainbow("Health").crimson, character.hp]
    t << :separator
    t.add_row [Rainbow("Attack").color("#3cdc14"), character.atk]
    t << :separator
    t.add_row [Rainbow("Defense").orange, character.def]
  end
  puts table
end

#Selects what to do with character
def select_character_action(prompt, character)
  prompt.select(Rainbow("What does #{character.name} want to do?").teal) do |menu|
    menu.enum '.'

    menu.choice 'Join Guild', 1
    menu.choice 'View Guild', 2
    menu.choice 'Leave Guild', 3
    menu.choice 'Delete Character', 4
  end
end

#Runs the program
def run(user)
  prompt = TTY::Prompt.new
  while true
    selected_char = get_user_action(prompt, user)
    display_character_info(selected_char)
    select_character_action(prompt, selected_char)
  end
end
