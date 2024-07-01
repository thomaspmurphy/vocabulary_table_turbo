# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Define terms and definitions from Nishida Kitaro's philosophy
definitions = [
  { term: '絶対無',
    definition: "Absolute Nothingness - This is one of Nishida's most central concepts. Absolute Nothingness is not mere emptiness or void but a dynamic and creative force that transcends all dichotomies and oppositions. It is the ground of being and the source of all reality." },
  { term: '自己否定',
    definition: "Self-Negation - Self-negation is a process where the self denies or transcends itself to achieve a higher form of existence. This concept is central to Nishida's idea of personal development and self-realization, where one overcomes the ego to reach a state of unity with Absolute Nothingness." },
  { term: '純粋経験',
    definition: 'Pure Experience - Pure Experience is the immediate, direct experience of reality before it is conceptualized or interpreted by the mind. For Nishida, this is the fundamental mode of human existence, where subject and object are not yet differentiated.' },
  { term: '場所',
    definition: "Place or Field - Nishida uses the concept of Basho to describe the context or field within which all phenomena appear. It is a non-dualistic field that contains both the subjective and objective aspects of reality. In a sense, Basho is the 'place' where Absolute Nothingness manifests." },
  { term: '弁証法',
    definition: "Dialectic - Nishida's dialectic involves a process of thesis-antithesis-synthesis but is rooted in the dynamic interplay of Absolute Nothingness and being. His dialectic aims to overcome binary oppositions and reach a higher unity, influenced by both Western and Eastern philosophies." },
  { term: '直観',
    definition: 'Intuition - Intuition, for Nishida, is a form of direct, non-conceptual knowledge. It is closely related to Pure Experience and is the way through which one can grasp the true nature of reality.' },
  { term: '行為的直観',
    definition: 'Acting Intuition - Coined by Nishida, this term combines intuition with action. It signifies a mode of understanding reality through active engagement and practice, not just passive contemplation.' },
  { term: '無限',
    definition: "Infinity - Infinity in Nishida's philosophy refers to the boundless nature of reality as it unfolds from Absolute Nothingness. It is not a static infinity but a dynamic and self-negating process that generates all finite beings." },
  { term: '相対性',
    definition: 'Relationality - Relationality is the idea that all things exist in relation to each other. For Nishida, everything is interconnected within the field of Absolute Nothingness, and no entity can be understood in isolation.' },
  { term: '自己同一',
    definition: "Self-Identity - Self-Identity refers to the process of achieving a higher unity with the self and the cosmos. It involves recognizing the self's roots in Absolute Nothingness and transcending individual ego to attain a universal self-identity." }
]

# Create definitions in the database
definitions.each do |data|
  Definition.create!(term: data[:term], definition: data[:definition])
end

puts "Seed data for Nishida Kitaro's philosophy has been successfully created."
