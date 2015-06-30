require 'spec_helper'

RSpec.describe MobileSignalFetcher::Network::Bars do
  context '5 Bars' do
    [*-61..-50].each do |db|
      it { expect(described_class.find(db.to_s)).to eq(5) }
    end

    it 'handles complex numbers' do
      expect(described_class.find('-60.481771171')).to eq(5)
      expect(described_class.find('-60.9')).to eq(5)
    end
  end

  context '4 Bars' do
    [*-73..-62].each do |db|
      it { expect(described_class.find(db.to_s)).to eq(4) }
    end

    it 'handles complex numbers' do
      expect(described_class.find('-61.9')).to eq(4)
      expect(described_class.find('-73.481771171')).to eq(4)
    end
  end

  context '3 Bars' do
    [*-84..-74].each do |db|
      it { expect(described_class.find(db.to_s)).to eq(3) }
    end

    it 'handles complex numbers' do
      expect(described_class.find('-73.9')).to eq(3)
      expect(described_class.find('-84.481771171')).to eq(3)
    end
  end

  context '2 Bars' do
    [*-95..-85].each do |db|
      it { expect(described_class.find(db.to_s)).to eq(2) }
    end

    it 'handles complex numbers' do
      expect(described_class.find('-84.9')).to eq(2)
      expect(described_class.find('-95.481771171')).to eq(2)
    end
  end

  context '1 Bars' do
    [*-102..-96].each do |db|
      it { expect(described_class.find(db.to_s)).to eq(1) }
    end

    it 'handles complex numbers' do
      expect(described_class.find('-95.9')).to eq(1)
      expect(described_class.find('-102.481771171')).to eq(1)
    end
  end

  context '0 Bars' do
    [*-150..-103].each do |db|
      it { expect(described_class.find(db.to_s)).to eq(0) }
    end

    it 'handles complex numbers' do
      expect(described_class.find('-105.9')).to eq(0)
    end
  end
end
