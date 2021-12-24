CREATE UNIQUE INDEX router_control_uk
ON ccdetail.router_control
USING BTREE (rc_instance_name ASC, rc_location ASC, rc_server_name ASC);

