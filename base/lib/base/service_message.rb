# Copyright (c) 2009-2011 VMware, Inc.
#
require 'api/message'

module VCAP::Services::Internal

  # Provisioner --> Node
  class ProvisionRequest < ServiceMessage
    required :plan, String
    optional :credentials
  end

  # Node --> Provisioner
  class ProvisionResponse < ServiceMessage
    required :success
    optional :credentials
    optional :error
  end

  class UnprovisionRequest < ServiceMessage
    required :name, String
    required :bindings, [Hash]
  end

  class BindRequest < ServiceMessage
    required :name, String
    optional :bind_opts, Hash
    optional :credentials
  end

  class BindResponse < ServiceMessage
    required :success
    optional :credentials
    optional :error
  end

  class UnbindRequest < ServiceMessage
    required :credentials
  end

  class SimpleResponse < ServiceMessage
    required :success
    optional :error
  end

  class RestoreRequest < ServiceMessage
    required :instance_id
    required :backup_path
  end

  class CheckOrphanRequest < ServiceMessage
    required :handles
  end

  class CheckOrphanResponse < ServiceMessage
    required :success
    optional :error
    # A hash for orphan instances
    # Key: the id of the node with orphans
    # Value: orphan instances list
    optional :orphan_instances
    # A hash for orphan bindings
    # Key: the id of the node with orphans
    # Value: orphan bindings list
    optional :orphan_bindings
  end

  class PurgeOrphanRequest < ServiceMessage
    # A list of orphan instances names
    required :orphan_ins_list
    # A list of orphan bindings credentials
    required :orphan_binding_list
  end
end
