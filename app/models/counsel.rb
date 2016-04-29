class Counsel
  attr_reader :counselors

  MAX_VOTE_ATTEMPTS = 5

  def initialize(king, counselors, current_quest)
    @king = king
    @counselors = counselors
    @quest = current_quest
  end

  def accept_party?
    votes = counselors.reduce(0) { |sum, counselor| sum += counselor.vote }
    votes > counselors.count / 2
  end

  def start
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

    king_decide unless party_accepted
  end

  private

  def assemble_a_party
    players_list = @counselors + [@king]
    party = []
    (1..@quest.party_size).each do |_|
      index =  rand(0..players_list.length - 1)
      party << players_list.delete_at(index)
    end

    party
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
    party = assemble_a_party(@quest.party_size)
    puts "O rei escolheu #{party.map(&:name).join(' / ')}"
  end
end
