class Entry < ApplicationRecord
  has_many :samples
  accepts_nested_attributes_for :samples, allow_destroy: true, 
            reject_if: proc {|attr| attr['de'].blank? or attr['ru'].blank?}
            
  enum pos: %w(Adjektiv Adverb Artikel Ausdruck Interjektion Konjuktion Nomen Numerale Partikel Personalpronoun Präposition Pronomen Verb Funktionswort)
  enum art: %w(Null der die das)
  
  validates :de,   presence: true
  validates :en,   presence: true
  validates :ru,   presence: true
end
