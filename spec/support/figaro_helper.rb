module FigaroHelper
  def mock_env(override)
    stub = FigaroEnvStub.new(Figaro.env, override)
    allow(Figaro).to receive(:env).and_return(stub)
    stub
  end
end

class FigaroEnvStub
  def initialize(env, override)
    @env = env
    @override = HashWithIndifferentAccess.new(override || {})
  end

  def method_missing(m, *_args)
    return @override[m] if @override.key?(m)
    @env.send(m)
  end
end
