class Counsel
  attr_reader :counselors

  MAX_VOTE_ATTEMPTS = 5

  def initialize(king, counselors, current_quest)
    @king = king
    @counselors = counselors
    @quest = current_quest
    @voted_parties = []
  end

  def accept_party?
    votes = counselors.reduce(0) { |sum, counselor| sum += counselor.vote }
    votes > counselors.count / 2
  end

  def summon_the_knights
    party = assemble_a_party
    puts "O rei escolheu #{party.map(&:name).join(' / ')}"
    puts 'O conselho se reúne para decidir'

    vote_attempts = 0
    party_accepted = accept_party?
    print_counsel_decision(party_accepted)

    while vote_attempts < MAX_VOTE_ATTEMPTS - 1 && !party_accepted
      vote_attempts += 1
      party = assemble_a_party
      puts "O rei escolheu um novo grupo de cavaleiros: #{party.map(&:name).join(' / ')}"

      party_accepted = accept_party?
      print_counsel_decision(party_accepted)
    end

    party = king_decide unless party_accepted

    Knights.new(party)
  end

  private

  def assemble_a_party
    players_list = @counselors + [@king]
    party = []
    (1..@quest.party_size).each do |_|
      index =  rand(0..players_list.length - 1)
      party << players_list.delete_at(index)
    end

    party.sort!

    if @voted_parties.include?(party)
      puts "O rei tentou convocar novamente um grupo rejeitado (#{party.map(&:name).join(' / ')}), mas as leis de Avalon o obrigaram a mudar de ideia"
      assemble_a_party
    else
      @voted_parties << party
      party
    end
  end

  def print_counsel_decision(party_accepted)
    if party_accepted
      puts 'O conselho aprovou os cavaleiros!'
    else
      puts 'O conselho desconfiou de traição e rejeitou a escolha do rei.'
    end
  end

  def king_decide
    puts 'Cansado de seus conselheiros, o rei decide sozinho.'
    party = assemble_a_party
    puts "O rei escolheu #{party.map(&:name).join(' / ')}"

    party
  end
end
