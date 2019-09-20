include $(REP_DIR)/lib/import/import-grpc.mk
include $(REP_DIR)/lib/import/import-protobuf.mk

GRPC_DIR           := $(GRPC_PORT_DIR)/src/lib/grpc
GRPC_SRC_DIR       := $(GRPC_DIR)/src/cpp
GRPC_CORE_SRC_DIR  := $(GRPC_DIR)/src/core
GRPC_PROTO_DIR     := $(GRPC_DIR)/src/proto/grpc

LIBS               := base
LIBS               += libc
LIBS               += libssl
LIBS               += protobuf
LIBS               += stdcxx
LIBS               += zlib

SHARED_LIB         := yes

CC_CXX_WARN_STRICT :=
CC_OPT             += -DGPR_CUSTOM_SYNC -DHAVE_CONFIG_H

INC_DIR            += $(GRPC_DIR)
INC_DIR            += $(GRPC_DIR)/src/core/ext/upb-generated
INC_DIR            += $(GRPC_DIR)/third_party/upb
INC_DIR            += $(GRPC_DIR)/third_party/abseil-cpp
INC_DIR            += $(GRPC_DIR)/third_party/address_sorting/include
INC_DIR            += $(GRPC_DIR)/third_party/cares
INC_DIR            += $(GRPC_DIR)/third_party/cares/cares
INC_DIR            += $(GRPC_DIR)/third_party/cares/config_freebsd

GENODE_TOOL_DIR    := /usr/local/genode/protobuf_grpc/current/bin
PROTOC             := $(GENODE_TOOL_DIR)/protoc
GRPC_PLUGIN        := $(GENODE_TOOL_DIR)/grpc_cpp_plugin

SRC_CC := client/channel_cc.cc
SRC_CC += client/client_context.cc
SRC_CC += client/client_interceptor.cc
SRC_CC += client/create_channel.cc
SRC_CC += client/create_channel_internal.cc
SRC_CC += client/create_channel_posix.cc
SRC_CC += client/credentials_cc.cc
SRC_CC += client/cronet_credentials.cc
SRC_CC += client/generic_stub.cc
SRC_CC += client/insecure_credentials.cc
SRC_CC += client/secure_credentials.cc
SRC_CC += codegen/codegen_init.cc
SRC_CC += common/alarm.cc
SRC_CC += common/auth_property_iterator.cc
SRC_CC += common/channel_arguments.cc
SRC_CC += common/completion_queue_cc.cc
SRC_CC += common/core_codegen.cc
SRC_CC += common/resource_quota_cc.cc
SRC_CC += common/rpc_method.cc
SRC_CC += common/secure_auth_context.cc
SRC_CC += common/secure_channel_arguments.cc
SRC_CC += common/secure_create_auth_context.cc
SRC_CC += common/validate_service_config.cc
SRC_CC += common/version_cc.cc
SRC_CC += ext/filters/census/grpc_context.cc
SRC_CC += ext/filters/client_channel/backend_metric.cc
SRC_CC += ext/filters/client_channel/backup_poller.cc
SRC_CC += ext/filters/client_channel/channel_connectivity.cc
SRC_CC += ext/filters/client_channel/client_channel.cc
SRC_CC += ext/filters/client_channel/client_channel_channelz.cc
SRC_CC += ext/filters/client_channel/client_channel_factory.cc
SRC_CC += ext/filters/client_channel/client_channel_plugin.cc
SRC_CC += ext/filters/client_channel/connector.cc
SRC_CC += ext/filters/client_channel/global_subchannel_pool.cc
SRC_CC += ext/filters/client_channel/health/health_check_client.cc
SRC_CC += ext/filters/client_channel/http_connect_handshaker.cc
SRC_CC += ext/filters/client_channel/http_proxy.cc
SRC_CC += ext/filters/client_channel/lb_policy.cc
SRC_CC += ext/filters/client_channel/lb_policy/grpclb/client_load_reporting_filter.cc
SRC_CC += ext/filters/client_channel/lb_policy/grpclb/grpclb.cc
SRC_CC += ext/filters/client_channel/lb_policy/grpclb/grpclb_channel_secure.cc
SRC_CC += ext/filters/client_channel/lb_policy/grpclb/grpclb_client_stats.cc
SRC_CC += ext/filters/client_channel/lb_policy/grpclb/load_balancer_api.cc
SRC_CC += ext/filters/client_channel/lb_policy/pick_first/pick_first.cc
SRC_CC += ext/filters/client_channel/lb_policy/round_robin/round_robin.cc
SRC_CC += ext/filters/client_channel/lb_policy/xds/xds.cc
SRC_CC += ext/filters/client_channel/lb_policy/xds/xds_channel_secure.cc
SRC_CC += ext/filters/client_channel/lb_policy/xds/xds_client_stats.cc
SRC_CC += ext/filters/client_channel/lb_policy/xds/xds_load_balancer_api.cc
SRC_CC += ext/filters/client_channel/lb_policy_registry.cc
SRC_CC += ext/filters/client_channel/local_subchannel_pool.cc
SRC_CC += ext/filters/client_channel/parse_address.cc
SRC_CC += ext/filters/client_channel/proxy_mapper.cc
SRC_CC += ext/filters/client_channel/proxy_mapper_registry.cc
SRC_CC += ext/filters/client_channel/resolver.cc
SRC_CC += ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_ev_driver_libuv.cc
SRC_CC += ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_ev_driver_posix.cc
SRC_CC += ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_ev_driver_windows.cc
SRC_CC += ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_wrapper_libuv.cc
SRC_CC += ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_wrapper_posix.cc
SRC_CC += ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_wrapper_windows.cc
SRC_CC += ext/filters/client_channel/resolver/dns/dns_resolver_selection.cc
SRC_CC += ext/filters/client_channel/resolver/dns/native/dns_resolver.cc
SRC_CC += ext/filters/client_channel/resolver/fake/fake_resolver.cc
SRC_CC += ext/filters/client_channel/resolver/sockaddr/sockaddr_resolver.cc
SRC_CC += ext/filters/client_channel/resolver/xds/xds_resolver.cc
SRC_CC += ext/filters/client_channel/resolver_registry.cc
SRC_CC += ext/filters/client_channel/resolver_result_parsing.cc
SRC_CC += ext/filters/client_channel/resolving_lb_policy.cc
SRC_CC += ext/filters/client_channel/retry_throttle.cc
SRC_CC += ext/filters/client_channel/server_address.cc
SRC_CC += ext/filters/client_channel/service_config.cc
SRC_CC += ext/filters/client_channel/subchannel.cc
SRC_CC += ext/filters/client_channel/subchannel_pool_interface.cc
SRC_CC += ext/filters/client_channel/resolver/dns/c_ares/dns_resolver_ares.cc
SRC_CC += ext/filters/client_idle/client_idle_filter.cc
SRC_CC += ext/filters/deadline/deadline_filter.cc
SRC_CC += ext/filters/http/client/http_client_filter.cc
SRC_CC += ext/filters/http/client_authority_filter.cc
SRC_CC += ext/filters/http/http_filters_plugin.cc
SRC_CC += ext/filters/http/message_compress/message_compress_filter.cc
SRC_CC += ext/filters/http/server/http_server_filter.cc
SRC_CC += ext/filters/max_age/max_age_filter.cc
SRC_CC += ext/filters/message_size/message_size_filter.cc
SRC_CC += ext/filters/workarounds/workaround_cronet_compression_filter.cc
SRC_CC += ext/filters/workarounds/workaround_utils.cc
SRC_CC += ext/transport/chttp2/alpn/alpn.cc
SRC_CC += ext/transport/chttp2/client/authority.cc
SRC_CC += ext/transport/chttp2/client/chttp2_connector.cc
SRC_CC += ext/transport/chttp2/client/insecure/channel_create.cc
SRC_CC += ext/transport/chttp2/client/insecure/channel_create_posix.cc
SRC_CC += ext/transport/chttp2/client/secure/secure_channel_create.cc
SRC_CC += ext/transport/chttp2/server/chttp2_server.cc
SRC_CC += ext/transport/chttp2/server/insecure/server_chttp2.cc
SRC_CC += ext/transport/chttp2/server/insecure/server_chttp2_posix.cc
SRC_CC += ext/transport/chttp2/server/secure/server_secure_chttp2.cc
SRC_CC += ext/transport/chttp2/transport/bin_decoder.cc
SRC_CC += ext/transport/chttp2/transport/bin_encoder.cc
SRC_CC += ext/transport/chttp2/transport/chttp2_plugin.cc
SRC_CC += ext/transport/chttp2/transport/chttp2_transport.cc
SRC_CC += ext/transport/chttp2/transport/context_list.cc
SRC_CC += ext/transport/chttp2/transport/flow_control.cc
SRC_CC += ext/transport/chttp2/transport/frame_data.cc
SRC_CC += ext/transport/chttp2/transport/frame_goaway.cc
SRC_CC += ext/transport/chttp2/transport/frame_ping.cc
SRC_CC += ext/transport/chttp2/transport/frame_rst_stream.cc
SRC_CC += ext/transport/chttp2/transport/frame_settings.cc
SRC_CC += ext/transport/chttp2/transport/frame_window_update.cc
SRC_CC += ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_wrapper.cc
SRC_CC += ext/filters/client_channel/resolver/dns/c_ares/grpc_ares_ev_driver.cc
SRC_CC += ext/transport/chttp2/transport/hpack_encoder.cc
SRC_CC += ext/transport/chttp2/transport/hpack_parser.cc
SRC_CC += ext/transport/chttp2/transport/hpack_table.cc
SRC_CC += ext/transport/chttp2/transport/http2_settings.cc
SRC_CC += ext/transport/chttp2/transport/huffsyms.cc
SRC_CC += ext/transport/chttp2/transport/incoming_metadata.cc
SRC_CC += ext/transport/chttp2/transport/parsing.cc
SRC_CC += ext/transport/chttp2/transport/stream_lists.cc
SRC_CC += ext/transport/chttp2/transport/stream_map.cc
SRC_CC += ext/transport/chttp2/transport/varint.cc
SRC_CC += ext/transport/chttp2/transport/writing.cc
SRC_CC += ext/transport/cronet/client/secure/cronet_channel_create.cc
SRC_CC += ext/transport/cronet/transport/cronet_api_dummy.cc
SRC_CC += ext/transport/cronet/transport/cronet_transport.cc
SRC_CC += ext/transport/inproc/inproc_plugin.cc
SRC_CC += ext/transport/inproc/inproc_transport.cc
SRC_CC += lib/avl/avl.cc
SRC_CC += lib/backoff/backoff.cc
SRC_CC += lib/channel/channel_args.cc
SRC_CC += lib/channel/channel_stack.cc
SRC_CC += lib/channel/channel_stack_builder.cc
SRC_CC += lib/channel/channel_trace.cc
SRC_CC += lib/channel/channelz.cc
SRC_CC += lib/channel/channelz_registry.cc
SRC_CC += lib/channel/connected_channel.cc
SRC_CC += lib/channel/handshaker.cc
SRC_CC += lib/channel/handshaker_registry.cc
SRC_CC += lib/channel/status_util.cc
SRC_CC += lib/compression/compression.cc
SRC_CC += lib/compression/compression_args.cc
SRC_CC += lib/compression/compression_internal.cc
SRC_CC += lib/compression/message_compress.cc
SRC_CC += lib/compression/stream_compression.cc
SRC_CC += lib/compression/stream_compression_gzip.cc
SRC_CC += lib/compression/stream_compression_identity.cc
SRC_CC += lib/debug/stats.cc
SRC_CC += lib/debug/stats_data.cc
SRC_CC += lib/debug/trace.cc
SRC_CC += lib/gpr/alloc.cc
SRC_CC += lib/gpr/atm.cc
SRC_CC += lib/gpr/cpu_iphone.cc
SRC_CC += lib/gpr/cpu_linux.cc
SRC_CC += lib/gpr/cpu_posix.cc
SRC_CC += lib/gpr/cpu_windows.cc
SRC_CC += lib/gpr/env_linux.cc
SRC_CC += lib/gpr/env_posix.cc
SRC_CC += lib/gpr/env_windows.cc
SRC_CC += lib/gpr/log.cc
SRC_CC += lib/gpr/log_android.cc
SRC_CC += lib/gpr/log_linux.cc
SRC_CC += lib/gpr/log_posix.cc
SRC_CC += lib/gpr/log_windows.cc
SRC_CC += lib/gpr/mpscq.cc
SRC_CC += lib/gpr/murmur_hash.cc
SRC_CC += lib/gpr/string.cc
SRC_CC += lib/gpr/string_posix.cc
SRC_CC += lib/gpr/string_util_windows.cc
SRC_CC += lib/gpr/string_windows.cc
SRC_CC += lib/gpr/sync.cc
SRC_CC += lib/gpr/sync_posix.cc
SRC_CC += lib/gpr/sync_windows.cc
SRC_CC += lib/gpr/time.cc
SRC_CC += lib/gpr/time_posix.cc
SRC_CC += lib/gpr/time_precise.cc
SRC_CC += lib/gpr/time_windows.cc
SRC_CC += lib/gpr/tls_pthread.cc
SRC_CC += lib/gpr/tmpfile_msys.cc
SRC_CC += lib/gpr/tmpfile_posix.cc
SRC_CC += lib/gpr/tmpfile_windows.cc
SRC_CC += lib/gpr/wrap_memcpy.cc
SRC_CC += lib/gprpp/arena.cc
SRC_CC += lib/gprpp/fork.cc
SRC_CC += lib/gprpp/global_config_env.cc
SRC_CC += lib/gprpp/host_port.cc
SRC_CC += lib/gprpp/thd_posix.cc
SRC_CC += lib/gprpp/thd_windows.cc
SRC_CC += lib/http/format_request.cc
SRC_CC += lib/http/httpcli.cc
SRC_CC += lib/http/httpcli_security_connector.cc
SRC_CC += lib/http/parser.cc
SRC_CC += lib/iomgr/buffer_list.cc
SRC_CC += lib/iomgr/call_combiner.cc
SRC_CC += lib/iomgr/cfstream_handle.cc
SRC_CC += lib/iomgr/combiner.cc
SRC_CC += lib/iomgr/endpoint.cc
SRC_CC += lib/iomgr/endpoint_cfstream.cc
SRC_CC += lib/iomgr/endpoint_pair_posix.cc
SRC_CC += lib/iomgr/endpoint_pair_uv.cc
SRC_CC += lib/iomgr/endpoint_pair_windows.cc
SRC_CC += lib/iomgr/error.cc
SRC_CC += lib/iomgr/error_cfstream.cc
SRC_CC += lib/iomgr/ev_epoll1_linux.cc
SRC_CC += lib/iomgr/ev_epollex_linux.cc
SRC_CC += lib/iomgr/ev_poll_posix.cc
SRC_CC += lib/iomgr/ev_posix.cc
SRC_CC += lib/iomgr/ev_windows.cc
SRC_CC += lib/iomgr/exec_ctx.cc
SRC_CC += lib/iomgr/executor.cc
SRC_CC += lib/iomgr/executor/mpmcqueue.cc
SRC_CC += lib/iomgr/executor/threadpool.cc
SRC_CC += lib/iomgr/fork_posix.cc
SRC_CC += lib/iomgr/fork_windows.cc
SRC_CC += lib/iomgr/gethostname_fallback.cc
SRC_CC += lib/iomgr/gethostname_host_name_max.cc
SRC_CC += lib/iomgr/gethostname_sysconf.cc
SRC_CC += lib/iomgr/grpc_if_nametoindex_posix.cc
SRC_CC += lib/iomgr/internal_errqueue.cc
SRC_CC += lib/iomgr/iocp_windows.cc
SRC_CC += lib/iomgr/iomgr.cc
SRC_CC += lib/iomgr/iomgr_custom.cc
SRC_CC += lib/iomgr/iomgr_internal.cc
SRC_CC += lib/iomgr/iomgr_posix.cc
SRC_CC += lib/iomgr/iomgr_posix_cfstream.cc
SRC_CC += lib/iomgr/iomgr_uv.cc
SRC_CC += lib/iomgr/iomgr_windows.cc
SRC_CC += lib/iomgr/is_epollexclusive_available.cc
SRC_CC += lib/iomgr/load_file.cc
SRC_CC += lib/iomgr/lockfree_event.cc
SRC_CC += lib/iomgr/polling_entity.cc
SRC_CC += lib/iomgr/pollset.cc
SRC_CC += lib/iomgr/pollset_custom.cc
SRC_CC += lib/iomgr/pollset_set.cc
SRC_CC += lib/iomgr/pollset_set_custom.cc
SRC_CC += lib/iomgr/pollset_set_windows.cc
SRC_CC += lib/iomgr/pollset_uv.cc
SRC_CC += lib/iomgr/pollset_windows.cc
SRC_CC += lib/iomgr/resolve_address.cc
SRC_CC += lib/iomgr/resolve_address_custom.cc
SRC_CC += lib/iomgr/resolve_address_posix.cc
SRC_CC += lib/iomgr/resolve_address_windows.cc
SRC_CC += lib/iomgr/resource_quota.cc
SRC_CC += lib/iomgr/sockaddr_utils.cc
SRC_CC += lib/iomgr/socket_factory_posix.cc
SRC_CC += lib/iomgr/socket_mutator.cc
SRC_CC += lib/iomgr/socket_utils_common_posix.cc
SRC_CC += lib/iomgr/socket_utils_linux.cc
SRC_CC += lib/iomgr/socket_utils_posix.cc
SRC_CC += lib/iomgr/socket_utils_uv.cc
SRC_CC += lib/iomgr/socket_utils_windows.cc
SRC_CC += lib/iomgr/socket_windows.cc
SRC_CC += lib/iomgr/tcp_client.cc
SRC_CC += lib/iomgr/tcp_client_cfstream.cc
SRC_CC += lib/iomgr/tcp_client_custom.cc
SRC_CC += lib/iomgr/tcp_client_posix.cc
SRC_CC += lib/iomgr/tcp_client_windows.cc
SRC_CC += lib/iomgr/tcp_custom.cc
SRC_CC += lib/iomgr/tcp_posix.cc
SRC_CC += lib/iomgr/tcp_server.cc
SRC_CC += lib/iomgr/tcp_server_custom.cc
SRC_CC += lib/iomgr/tcp_server_posix.cc
SRC_CC += lib/iomgr/tcp_server_utils_posix_common.cc
SRC_CC += lib/iomgr/tcp_server_utils_posix_ifaddrs.cc
SRC_CC += lib/iomgr/tcp_server_utils_posix_noifaddrs.cc
SRC_CC += lib/iomgr/tcp_server_windows.cc
SRC_CC += lib/iomgr/tcp_uv.cc
SRC_CC += lib/iomgr/tcp_windows.cc
SRC_CC += lib/iomgr/time_averaged_stats.cc
SRC_CC += lib/iomgr/timer.cc
SRC_CC += lib/iomgr/timer_custom.cc
SRC_CC += lib/iomgr/timer_generic.cc
SRC_CC += lib/iomgr/timer_heap.cc
SRC_CC += lib/iomgr/timer_manager.cc
SRC_CC += lib/iomgr/timer_uv.cc
SRC_CC += lib/iomgr/udp_server.cc
SRC_CC += lib/iomgr/unix_sockets_posix.cc
SRC_CC += lib/iomgr/unix_sockets_posix_noop.cc
SRC_CC += lib/iomgr/wakeup_fd_eventfd.cc
SRC_CC += lib/iomgr/wakeup_fd_nospecial.cc
SRC_CC += lib/iomgr/wakeup_fd_pipe.cc
SRC_CC += lib/iomgr/wakeup_fd_posix.cc
SRC_CC += lib/json/json.cc
SRC_CC += lib/json/json_reader.cc
SRC_CC += lib/json/json_string.cc
SRC_CC += lib/json/json_writer.cc
SRC_CC += lib/profiling/basic_timers.cc
SRC_CC += lib/profiling/stap_timers.cc
SRC_CC += lib/security/context/security_context.cc
SRC_CC += lib/security/credentials/alts/alts_credentials.cc
SRC_CC += lib/security/credentials/alts/check_gcp_environment.cc
SRC_CC += lib/security/credentials/alts/check_gcp_environment_linux.cc
SRC_CC += lib/security/credentials/alts/check_gcp_environment_no_op.cc
SRC_CC += lib/security/credentials/alts/check_gcp_environment_windows.cc
SRC_CC += lib/security/credentials/alts/grpc_alts_credentials_client_options.cc
SRC_CC += lib/security/credentials/alts/grpc_alts_credentials_options.cc
SRC_CC += lib/security/credentials/alts/grpc_alts_credentials_server_options.cc
SRC_CC += lib/security/credentials/composite/composite_credentials.cc
SRC_CC += lib/security/credentials/credentials.cc
SRC_CC += lib/security/credentials/credentials_metadata.cc
SRC_CC += lib/security/credentials/fake/fake_credentials.cc
SRC_CC += lib/security/credentials/google_default/credentials_generic.cc
SRC_CC += lib/security/credentials/google_default/google_default_credentials.cc
SRC_CC += lib/security/credentials/iam/iam_credentials.cc
SRC_CC += lib/security/credentials/jwt/json_token.cc
SRC_CC += lib/security/credentials/jwt/jwt_credentials.cc
SRC_CC += lib/security/credentials/jwt/jwt_verifier.cc
SRC_CC += lib/security/credentials/local/local_credentials.cc
SRC_CC += lib/security/credentials/oauth2/oauth2_credentials.cc
SRC_CC += lib/security/credentials/plugin/plugin_credentials.cc
SRC_CC += lib/security/credentials/ssl/ssl_credentials.cc
SRC_CC += lib/security/credentials/tls/grpc_tls_credentials_options.cc
SRC_CC += lib/security/credentials/tls/spiffe_credentials.cc
SRC_CC += lib/security/security_connector/alts/alts_security_connector.cc
SRC_CC += lib/security/security_connector/fake/fake_security_connector.cc
SRC_CC += lib/security/security_connector/load_system_roots_fallback.cc
SRC_CC += lib/security/security_connector/load_system_roots_linux.cc
SRC_CC += lib/security/security_connector/local/local_security_connector.cc
SRC_CC += lib/security/security_connector/security_connector.cc
SRC_CC += lib/security/security_connector/ssl/ssl_security_connector.cc
SRC_CC += lib/security/security_connector/ssl_utils.cc
SRC_CC += lib/security/security_connector/ssl_utils_config.cc
SRC_CC += lib/security/security_connector/tls/spiffe_security_connector.cc
SRC_CC += lib/security/transport/client_auth_filter.cc
SRC_CC += lib/security/transport/secure_endpoint.cc
SRC_CC += lib/security/transport/security_handshaker.cc
SRC_CC += lib/security/transport/server_auth_filter.cc
SRC_CC += lib/security/transport/target_authority_table.cc
SRC_CC += lib/security/transport/tsi_error.cc
SRC_CC += lib/security/util/json_util.cc
SRC_CC += lib/slice/b64.cc
SRC_CC += lib/slice/percent_encoding.cc
SRC_CC += lib/slice/slice.cc
SRC_CC += lib/slice/slice_buffer.cc
SRC_CC += lib/slice/slice_intern.cc
SRC_CC += lib/slice/slice_string_helpers.cc
SRC_CC += lib/surface/api_trace.cc
SRC_CC += lib/surface/byte_buffer.cc
SRC_CC += lib/surface/byte_buffer_reader.cc
SRC_CC += lib/surface/call.cc
SRC_CC += lib/surface/call_details.cc
SRC_CC += lib/surface/call_log_batch.cc
SRC_CC += lib/surface/channel.cc
SRC_CC += lib/surface/channel_init.cc
SRC_CC += lib/surface/channel_ping.cc
SRC_CC += lib/surface/channel_stack_type.cc
SRC_CC += lib/surface/completion_queue.cc
SRC_CC += lib/surface/completion_queue_factory.cc
SRC_CC += lib/surface/event_string.cc
SRC_CC += lib/surface/init.cc
SRC_CC += lib/surface/init_secure.cc
SRC_CC += lib/surface/lame_client.cc
SRC_CC += lib/surface/metadata_array.cc
SRC_CC += lib/surface/server.cc
SRC_CC += lib/surface/validate_metadata.cc
SRC_CC += lib/surface/version.cc
SRC_CC += lib/transport/bdp_estimator.cc
SRC_CC += lib/transport/byte_stream.cc
SRC_CC += lib/transport/connectivity_state.cc
SRC_CC += lib/transport/error_utils.cc
SRC_CC += lib/transport/metadata.cc
SRC_CC += lib/transport/metadata_batch.cc
SRC_CC += lib/transport/pid_controller.cc
SRC_CC += lib/transport/static_metadata.cc
SRC_CC += lib/transport/status_conversion.cc
SRC_CC += lib/transport/status_metadata.cc
SRC_CC += lib/transport/timeout_encoding.cc
SRC_CC += lib/transport/transport.cc
SRC_CC += lib/transport/transport_op_string.cc
SRC_CC += lib/uri/uri_parser.cc
SRC_CC += server/channel_argument_option.cc
SRC_CC += server/create_default_thread_pool.cc
SRC_CC += server/dynamic_thread_pool.cc
SRC_CC += server/external_connection_acceptor_impl.cc
SRC_CC += server/health/default_health_check_service.cc
SRC_CC += server/health/health_check_service.cc
SRC_CC += server/insecure_server_credentials.cc
SRC_CC += server/secure_server_credentials.cc
SRC_CC += server/server_builder.cc
SRC_CC += server/server_cc.cc
SRC_CC += server/server_context.cc
SRC_CC += server/server_credentials.cc
SRC_CC += server/server_posix.cc
SRC_CC += thread_manager/thread_manager.cc
SRC_CC += tsi/alts/crypt/aes_gcm.cc
SRC_CC += tsi/alts/crypt/gsec.cc
SRC_CC += tsi/alts/frame_protector/alts_counter.cc
SRC_CC += tsi/alts/frame_protector/alts_crypter.cc
SRC_CC += tsi/alts/frame_protector/alts_frame_protector.cc
SRC_CC += tsi/alts/frame_protector/alts_record_protocol_crypter_common.cc
SRC_CC += tsi/alts/frame_protector/alts_seal_privacy_integrity_crypter.cc
SRC_CC += tsi/alts/frame_protector/alts_unseal_privacy_integrity_crypter.cc
SRC_CC += tsi/alts/frame_protector/frame_handler.cc
SRC_CC += tsi/alts/handshaker/alts_handshaker_client.cc
SRC_CC += tsi/alts/handshaker/alts_shared_resource.cc
SRC_CC += tsi/alts/handshaker/alts_tsi_handshaker.cc
SRC_CC += tsi/alts/handshaker/alts_tsi_utils.cc
SRC_CC += tsi/alts/handshaker/transport_security_common_api.cc
SRC_CC += tsi/alts/zero_copy_frame_protector/alts_grpc_integrity_only_record_protocol.cc
SRC_CC += tsi/alts/zero_copy_frame_protector/alts_grpc_privacy_integrity_record_protocol.cc
SRC_CC += tsi/alts/zero_copy_frame_protector/alts_grpc_record_protocol_common.cc
SRC_CC += tsi/alts/zero_copy_frame_protector/alts_iovec_record_protocol.cc
SRC_CC += tsi/alts/zero_copy_frame_protector/alts_zero_copy_grpc_protector.cc
SRC_CC += tsi/fake_transport_security.cc
SRC_CC += tsi/local_transport_security.cc
SRC_CC += tsi/ssl/session_cache/ssl_session_boringssl.cc
SRC_CC += tsi/ssl/session_cache/ssl_session_cache.cc
SRC_CC += tsi/ssl/session_cache/ssl_session_openssl.cc
SRC_CC += tsi/ssl_transport_security.cc
SRC_CC += tsi/transport_security.cc
SRC_CC += tsi/transport_security_grpc.cc
SRC_CC += util/byte_buffer_cc.cc
SRC_CC += util/core_stats.cc
SRC_CC += util/error_details.cc
SRC_CC += util/status.cc
SRC_CC += util/string_ref.cc
SRC_CC += util/time_cc.cc
SRC_CC += plugin_registry/grpc_plugin_registry.cc

# generated files
SRC_CC += reflection.grpc.pb.cc
SRC_CC += stats.pb.cc
SRC_CC += status.pb.cc

SRC_C := ext/upb-generated/envoy/api/v2/core/address.upb.c
SRC_C += ext/upb-generated/envoy/api/v2/core/base.upb.c
SRC_C += ext/upb-generated/envoy/api/v2/core/http_uri.upb.c
SRC_C += ext/upb-generated/envoy/api/v2/discovery.upb.c
SRC_C += ext/upb-generated/envoy/api/v2/eds.upb.c
SRC_C += ext/upb-generated/envoy/api/v2/endpoint/endpoint.upb.c
SRC_C += ext/upb-generated/envoy/api/v2/endpoint/load_report.upb.c
SRC_C += ext/upb-generated/envoy/service/load_stats/v2/lrs.upb.c
SRC_C += ext/upb-generated/envoy/type/percent.upb.c
SRC_C += ext/upb-generated/google/protobuf/any.upb.c
SRC_C += ext/upb-generated/google/protobuf/duration.upb.c
SRC_C += ext/upb-generated/google/protobuf/struct.upb.c
SRC_C += ext/upb-generated/google/protobuf/timestamp.upb.c
SRC_C += ext/upb-generated/google/protobuf/wrappers.upb.c
SRC_C += ext/upb-generated/google/rpc/status.upb.c
SRC_C += ext/upb-generated/src/proto/grpc/gcp/handshaker.upb.c
SRC_C += ext/upb-generated/src/proto/grpc/gcp/transport_security_common.upb.c
SRC_C += ext/upb-generated/src/proto/grpc/health/v1/health.upb.c
SRC_C += ext/upb-generated/src/proto/grpc/lb/v1/load_balancer.upb.c
SRC_C += ext/upb-generated/udpa/data/orca/v1/orca_load_report.upb.c
SRC_C += third_party/address_sorting/address_sorting.c
SRC_C += third_party/address_sorting/address_sorting_posix.c
SRC_C += third_party/address_sorting/address_sorting_windows.c
SRC_C += third_party/cares/cares/ares__get_hostent.c
SRC_C += third_party/cares/cares/ares_parse_soa_reply.c
SRC_C += third_party/cares/cares/ares_free_string.c
SRC_C += third_party/cares/cares/ares_strerror.c
SRC_C += third_party/cares/cares/ares_parse_mx_reply.c
SRC_C += third_party/cares/cares/ares_process.c
SRC_C += third_party/cares/cares/ares_library_init.c
SRC_C += third_party/cares/cares/ares_parse_ns_reply.c
SRC_C += third_party/cares/cares/ares_options.c
SRC_C += third_party/cares/cares/bitncmp.c
SRC_C += third_party/cares/cares/inet_net_pton.c
SRC_C += third_party/cares/cares/ares_mkquery.c
SRC_C += third_party/cares/cares/ares_strsplit.c
SRC_C += third_party/cares/cares/ares_search.c
SRC_C += third_party/cares/cares/ares_getopt.c
SRC_C += third_party/cares/cares/ares__close_sockets.c
SRC_C += third_party/cares/cares/ares_cancel.c
SRC_C += third_party/cares/cares/ares_platform.c
SRC_C += third_party/cares/cares/ares_parse_a_reply.c
SRC_C += third_party/cares/cares/ares_gethostbyaddr.c
SRC_C += third_party/cares/cares/ares_strdup.c
SRC_C += third_party/cares/cares/ahost.c
SRC_C += third_party/cares/cares/ares_gethostbyname.c
SRC_C += third_party/cares/cares/ares_nowarn.c
SRC_C += third_party/cares/cares/ares__read_line.c
SRC_C += third_party/cares/cares/ares_timeout.c
SRC_C += third_party/cares/cares/ares_expand_name.c
SRC_C += third_party/cares/cares/inet_ntop.c
SRC_C += third_party/cares/cares/ares_parse_ptr_reply.c
SRC_C += third_party/cares/cares/ares_parse_srv_reply.c
SRC_C += third_party/cares/cares/ares_expand_string.c
SRC_C += third_party/cares/cares/ares_getenv.c
SRC_C += third_party/cares/cares/ares_parse_aaaa_reply.c
SRC_C += third_party/cares/cares/windows_port.c
SRC_C += third_party/cares/cares/ares_destroy.c
SRC_C += third_party/cares/cares/ares_init.c
SRC_C += third_party/cares/cares/ares_parse_txt_reply.c
SRC_C += third_party/cares/cares/ares_strcasecmp.c
SRC_C += third_party/cares/cares/ares_data.c
SRC_C += third_party/cares/cares/ares_getnameinfo.c
SRC_C += third_party/cares/cares/ares_parse_naptr_reply.c
SRC_C += third_party/cares/cares/ares_version.c
SRC_C += third_party/cares/cares/ares_create_query.c
SRC_C += third_party/cares/cares/ares_free_hostent.c
SRC_C += third_party/cares/cares/ares_fds.c
SRC_C += third_party/cares/cares/ares_android.c
SRC_C += third_party/cares/cares/ares_getsock.c
SRC_C += third_party/cares/cares/ares__timeval.c
SRC_C += third_party/cares/cares/ares_send.c
SRC_C += third_party/cares/cares/ares_writev.c
SRC_C += third_party/cares/cares/ares_query.c
SRC_C += third_party/cares/cares/ares_llist.c
SRC_C += third_party/upb/upb/decode.c
SRC_C += third_party/upb/upb/encode.c
SRC_C += third_party/upb/upb/msg.c
SRC_C += third_party/upb/upb/upb.c

# provide a dummy for if_indextoname
SRC_C += third_party/genode/if_indextoname.c

vpath %.c                $(GRPC_CORE_SRC_DIR)
vpath %.c                $(GRPC_DIR)
vpath %.cc               $(GRPC_SRC_DIR)
vpath %.cc               $(GRPC_CORE_SRC_DIR)
vpath stats.proto        $(GRPC_PROTO_DIR)/core
vpath status.proto       $(GRPC_PROTO_DIR)/status
vpath reflection.proto   $(GRPC_PROTO_DIR)/reflection/v1alpha

$(SRC_CC): stats.pb.h status.pb.h reflection.grpc.pb.h

stats.pb.h: stats.proto
	$(VERBOSE)$(PROTOC) --proto_path=$(GRPC_PROTO_DIR)/core \
	                    --proto_path=$(PROTO_FILES_DIR) \
	                    --cpp_out=. \
	                    $<

status.pb.h: status.proto
	$(VERBOSE)$(PROTOC) --proto_path=$(GRPC_PROTO_DIR)/status \
	                    --proto_path=$(PROTO_FILES_DIR) \
	                    --cpp_out=. \
	                    $<

reflection.grpc.pb.h: reflection.proto
	$(VERBOSE)$(PROTOC) --proto_path=$(GRPC_PROTO_DIR)/reflection/v1alpha \
	                    --proto_path=$(PROTO_FILES_DIR) \
	                    --cpp_out=. \
	                    $<
	$(VERBOSE)$(PROTOC) --plugin=protoc-gen-grpc=$(GRPC_PLUGIN) \
	                    --proto_path=$(PROTO_FILES_DIR) \
	                    --proto_path=$(GRPC_PROTO_DIR)/reflection/v1alpha \
	                    --grpc_out=. \
	                    $<
