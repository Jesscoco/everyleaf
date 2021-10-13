require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'Task model test' do
    context 'Si le Title la tâche est vide' do
      it "C'est difficile à Validation" do
        task = Task.new(name: '', content: '失敗test')
        expect(task).not_to be_valid
      end
    end
  end
  describe "fonction de validation taches vides" do
    context 'Si les détails de la tâche sont vides' do
      it 'Validation est intercepté' do
          # Écrivez du contenu ici
      end
    end
  end
  describe "fonction de validation des taches décrites" do
    context 'Si le Title et les détails de la tâche sont décrits' do
      it 'Validation passes' do
        # Écrivez du contenu ici
      end
    end
  end
end