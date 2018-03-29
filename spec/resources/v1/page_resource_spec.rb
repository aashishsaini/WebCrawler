module V1
  RSpec.describe PageResource do

    let :creatable_fields do
      [:url]
    end

    subject do
      described_class.new Page.new, {}
    end

    it 'expected to have creatable attributes' do
      expect(described_class.creatable_fields({}).sort).to eq (creatable_fields)
    end

    it 'expected to have updatable attributes' do
      expect(described_class.updatable_fields({}).sort).to eq ([])
    end

    it 'expected to have fetchable attributes' do
      expect(subject.fetchable_fields.sort).to eq (creatable_fields + [:id, :created_at, :updated_at, :content]).sort
    end
  end
end
