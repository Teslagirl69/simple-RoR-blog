# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { 'Article title' }
    text { 'Article text' }
    # создаём фабрику для создания статьи с несколькими комментариями
    factory :article_with_comments do
      # после создания article
      after :create do |article, _evaluator|
        # создаём список из 3-х комментариев
        create_list :comment, 3, article:
      end
    end
  end
end
