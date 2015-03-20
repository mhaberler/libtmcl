<?xml version='1.0' encoding='ISO-8859-1' standalone='yes' ?>
<tagfile>
  <compound kind="page">
    <name>index</name>
    <title>Trinamic Motion Control Language library</title>
    <filename>index</filename>
    <docanchor file="index">step1</docanchor>
    <docanchor file="index">NOTE</docanchor>
    <docanchor file="index">intro_sec</docanchor>
    <docanchor file="index">firststeps</docanchor>
    <docanchor file="index">install_sec</docanchor>
    <docanchor file="index">advanced</docanchor>
    <docanchor file="index">axispar</docanchor>
    <docanchor file="index">sendcommand</docanchor>
  </compound>
  <compound kind="file">
    <name>convenience.h</name>
    <path>/home/rschulze/IKP/Physics/Garching/src/libtmcl/src/tmcl/</path>
    <filename>convenience_8h</filename>
    <includes id="motor_8h" name="motor.h" local="yes" imported="no">motor.h</includes>
    <member kind="function">
      <type>int</type>
      <name>tmcl_move_to_pos_abs</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>ade9c1b3e4ada816b7bdd76d7fd2e1639</anchor>
      <arglist>(TMCLMotor *motor, int position)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_move_to_pos_rel</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>af1234e508a14ebfb3c2c6c0582fbb9d5</anchor>
      <arglist>(TMCLMotor *motor, int position)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_move_to_coord</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>acde409988cd13a2928523516d1a203f9</anchor>
      <arglist>(TMCLMotor *motor, int coordinate)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_stop</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>ac3dd7b3737010109df8b3bb800890bb7</anchor>
      <arglist>(TMCLMotor *motor)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_refsearch_start</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>a002fe6b01caeb3a1c4c245e15d96d5f0</anchor>
      <arglist>(TMCLMotor *motor)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_refsearch_stop</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>a5bbc946d3102331d43a010db44120149</anchor>
      <arglist>(TMCLMotor *motor)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_refsearch_status</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>acd7a790f78576279e83008880905834e</anchor>
      <arglist>(TMCLMotor *motor)</arglist>
    </member>
    <member kind="function">
      <type>int32_t</type>
      <name>tmcl_get_position</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>a83b30f371b69aa1bb4062963128c8404</anchor>
      <arglist>(TMCLMotor *motor)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_ror</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>a5f7be50971f8ee4a23abb0bfc796a3df</anchor>
      <arglist>(TMCLMotor *motor, int velocity)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_rol</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>ab347aea7a694742e7f9968cb6663dc85</anchor>
      <arglist>(TMCLMotor *motor, int velocity)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_set_max_current</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>a28d15f70ff3338d6b36dd67bc30a0f3d</anchor>
      <arglist>(TMCLMotor *motor, unsigned int percent)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_get_max_current</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>a52529417a99489b11f7bbd647fac8207</anchor>
      <arglist>(TMCLMotor *motor)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_set_max_standby_current</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>a1079e2a8e9a22a8279ace9befcf0c551</anchor>
      <arglist>(TMCLMotor *motor, unsigned int percent)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_get_max_standby_current</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>ae5c09e7de2fcd863cce97a4c34862ae1</anchor>
      <arglist>(TMCLMotor *motor)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_set_microsteps</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>a9b8738124f99ca6377b6b278e289d6a5</anchor>
      <arglist>(TMCLMotor *motor, int microsteps)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_get_microsteps</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>ab6498b8dabfb0bded2ff12488b86c4fe</anchor>
      <arglist>(TMCLMotor *motor)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_activate_limit_switch</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>abfa4f22d0004e1c6a6edae3720cbcd11</anchor>
      <arglist>(TMCLMotor *motor, int limit_switch)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_deactivate_limit_switch</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>aa64d4c054d237c284db2c76cde9c5070</anchor>
      <arglist>(TMCLMotor *motor, int limit_switch)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_get_limit_switch</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>acb47891de6c40e7054f3ae15e85ab1f8</anchor>
      <arglist>(TMCLMotor *motor, int limit_switch)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_set_no_ref_switch</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>a2f5d78884d6cc87a6d31abf2932f4d81</anchor>
      <arglist>(TMCLMotor *motor, int number)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_get_current_speed</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>a7c9af10e994fce71bb1055465176f16c</anchor>
      <arglist>(TMCLMotor *motor)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_set_refsearch_speed</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>abbdc689391aa6017a9accd1aa10eb958</anchor>
      <arglist>(TMCLMotor *motor, int fraction)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_get_refsearch_speed</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>a8c63f30cf717dbed4e0efd63af435574</anchor>
      <arglist>(TMCLMotor *motor)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_set_pos_speed</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>a56398eafa720e79aa9cbd73c309b2757</anchor>
      <arglist>(TMCLMotor *motor, int speed)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_get_pos_speed</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>ae4eb2a19056c163bfe83e91db4847e19</anchor>
      <arglist>(TMCLMotor *motor)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_get_limit_status</name>
      <anchorfile>convenience_8h.html</anchorfile>
      <anchor>a4099ac9f0bd1101fdd50dc5e97f86953</anchor>
      <arglist>(TMCLMotor *motor, int limit_switch)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>interface.h</name>
    <path>/home/rschulze/IKP/Physics/Garching/src/libtmcl/src/tmcl/</path>
    <filename>interface_8h</filename>
    <includes id="tmcldefs_8h" name="tmcldefs.h" local="no" imported="no">tmcl/tmcldefs.h</includes>
    <class kind="struct">TMCLInterfaceStruct</class>
    <member kind="typedef">
      <type>int(*</type>
      <name>tmcl_open_funcPtr</name>
      <anchorfile>interface_8h.html</anchorfile>
      <anchor>a1f8f6db177582534470f015805447f32</anchor>
      <arglist>)(struct TMCLInterfaceStruct *iface, const char *ifacename, void *)</arglist>
    </member>
    <member kind="typedef">
      <type>int(*</type>
      <name>tmcl_close_funcPtr</name>
      <anchorfile>interface_8h.html</anchorfile>
      <anchor>a9e7227a8c5d13beb62425dc812ffa50d</anchor>
      <arglist>)(struct TMCLInterfaceStruct *iface, void *)</arglist>
    </member>
    <member kind="typedef">
      <type>int(*</type>
      <name>tmcl_write_funcPtr</name>
      <anchorfile>interface_8h.html</anchorfile>
      <anchor>a4e986ad65eb977300f1a85a10667877a</anchor>
      <arglist>)(struct TMCLInterfaceStruct *iface, const void *buffer, int length, void *)</arglist>
    </member>
    <member kind="typedef">
      <type>int(*</type>
      <name>tmcl_read_funcPtr</name>
      <anchorfile>interface_8h.html</anchorfile>
      <anchor>a1f18ca4d75f24fb75ae4415f025cc7f7</anchor>
      <arglist>)(struct TMCLInterfaceStruct *iface, char *buffer, void *)</arglist>
    </member>
    <member kind="typedef">
      <type>struct TMCLInterfaceStruct</type>
      <name>TMCLInterface</name>
      <anchorfile>interface_8h.html</anchorfile>
      <anchor>a02607838b81b4bec6053a0781186c20d</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_init_interface</name>
      <anchorfile>interface_8h.html</anchorfile>
      <anchor>a6234d4f85bda5c0132fdecde69565ef4</anchor>
      <arglist>(TMCLInterface **iface, TMCLBusType bus, tmcl_open_funcPtr open, tmcl_close_funcPtr close, tmcl_read_funcPtr read, tmcl_write_funcPtr write)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>tmcl_set_open_data</name>
      <anchorfile>interface_8h.html</anchorfile>
      <anchor>a4cf02ca59d140317d11d965e6ae95e26</anchor>
      <arglist>(TMCLInterface *iface, void *func_pointer)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>tmcl_set_close_data</name>
      <anchorfile>interface_8h.html</anchorfile>
      <anchor>a928addfc26628720283c4710165e279e</anchor>
      <arglist>(TMCLInterface *iface, void *func_pointer)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>tmcl_set_read_data</name>
      <anchorfile>interface_8h.html</anchorfile>
      <anchor>a2ab1e5dc50c5cf71d9e3524b0854f077</anchor>
      <arglist>(TMCLInterface *iface, void *func_pointer)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>tmcl_set_write_data</name>
      <anchorfile>interface_8h.html</anchorfile>
      <anchor>a971ed663d2191ec0503be6e098de4d33</anchor>
      <arglist>(TMCLInterface *iface, void *func_pointer)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>tmcl_deinit_interface</name>
      <anchorfile>interface_8h.html</anchorfile>
      <anchor>a382b00c7bcc1c135272e7d4d14e493b8</anchor>
      <arglist>(TMCLInterface **iface)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_open_interface</name>
      <anchorfile>interface_8h.html</anchorfile>
      <anchor>a319f1f4969ffd9faebe4fef0c49d31bb</anchor>
      <arglist>(TMCLInterface *iface, const char *filename)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_close_interface</name>
      <anchorfile>interface_8h.html</anchorfile>
      <anchor>ab78b0151f64fbbeae0567e8db9d39487</anchor>
      <arglist>(TMCLInterface *iface)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>tmcl_interface_set_timeout</name>
      <anchorfile>interface_8h.html</anchorfile>
      <anchor>a8e317645c487f3c5c1ef8365c2e1733d</anchor>
      <arglist>(TMCLInterface *iface, unsigned int sec, unsigned int msec)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>tmcl_interface_set_timewait</name>
      <anchorfile>interface_8h.html</anchorfile>
      <anchor>af99259a37abb7f9d89847dcec8321254</anchor>
      <arglist>(TMCLInterface *iface, unsigned int sec, unsigned int msec)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>motor.h</name>
    <path>/home/rschulze/IKP/Physics/Garching/src/libtmcl/src/tmcl/</path>
    <filename>motor_8h</filename>
    <includes id="tmcldefs_8h" name="tmcldefs.h" local="no" imported="no">tmcl/tmcldefs.h</includes>
    <includes id="interface_8h" name="interface.h" local="no" imported="no">tmcl/interface.h</includes>
    <class kind="struct">TMCLMotorStruct</class>
    <member kind="typedef">
      <type>struct TMCLMotorStruct</type>
      <name>TMCLMotor</name>
      <anchorfile>motor_8h.html</anchorfile>
      <anchor>a14d786be976dfa481c05b4b712eca059</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_init_motor</name>
      <anchorfile>motor_8h.html</anchorfile>
      <anchor>a54fa9817766cc27bca3f7542ab748cc2</anchor>
      <arglist>(TMCLMotor **mot, TMCLInterface *iface, TMCLModel model, uint8_t address, uint8_t bank, TMCLBusType bus)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>tmcl_deinit_motor</name>
      <anchorfile>motor_8h.html</anchorfile>
      <anchor>a925e764d84777a9dc131546dd1b32699</anchor>
      <arglist>(TMCLMotor **mot)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_send_command</name>
      <anchorfile>motor_8h.html</anchorfile>
      <anchor>a0994799e6eeee41f70093c081bdc7d0a</anchor>
      <arglist>(TMCLMotor *mot, TMCLCommand tcom, TMCLReply *reply)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_update_axis_parameter</name>
      <anchorfile>motor_8h.html</anchorfile>
      <anchor>ac2cbc887882b38608ea63deb10f684bc</anchor>
      <arglist>(TMCLMotor *mot, int axis_parameter)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_set_axis_parameter</name>
      <anchorfile>motor_8h.html</anchorfile>
      <anchor>a55a0a1ad09c44b1386a528b4e74f3962</anchor>
      <arglist>(TMCLMotor *mot, int axis_parameter, int value)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_get_axis_parameter</name>
      <anchorfile>motor_8h.html</anchorfile>
      <anchor>acde6e9e540c95467c08ad479ca3627cd</anchor>
      <arglist>(TMCLMotor *mot, int axis_parameter)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_store_axis_parameter</name>
      <anchorfile>motor_8h.html</anchorfile>
      <anchor>a943cbb77b0d0bf244742c34211d03c17</anchor>
      <arglist>(TMCLMotor *mot, int axis_parameter)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>rsXXX.h</name>
    <path>/home/rschulze/IKP/Physics/Garching/src/libtmcl/src/tmcl/</path>
    <filename>rsXXX_8h</filename>
    <includes id="tmcldefs_8h" name="tmcldefs.h" local="no" imported="no">tmcl/tmcldefs.h</includes>
    <includes id="interface_8h" name="interface.h" local="no" imported="no">tmcl/interface.h</includes>
    <member kind="function">
      <type>int</type>
      <name>tmcl_open_rsXXX</name>
      <anchorfile>rsXXX_8h.html</anchorfile>
      <anchor>a3d01e21594c18d248fa6a7ad769c0769</anchor>
      <arglist>(TMCLInterface *iface, const char *filename, void *pointer)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_close_rsXXX</name>
      <anchorfile>rsXXX_8h.html</anchorfile>
      <anchor>a0ac132ac213a306a829db1f98ea6517b</anchor>
      <arglist>(TMCLInterface *iface, void *pointer)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_write_rsXXX</name>
      <anchorfile>rsXXX_8h.html</anchorfile>
      <anchor>a29d4db3ce6b3756743a51d3b1ccb49d1</anchor>
      <arglist>(TMCLInterface *iface, const void *buf, int length, void *pointer)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_poll_rsXXX</name>
      <anchorfile>rsXXX_8h.html</anchorfile>
      <anchor>aa8017d8e9d05727a7d6958865061c087</anchor>
      <arglist>(TMCLInterface *iface, char *buffer, void *pointer)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>tmcl.h</name>
    <path>/home/rschulze/IKP/Physics/Garching/src/libtmcl/src/tmcl/</path>
    <filename>tmcl_8h</filename>
    <includes id="tmcldefs_8h" name="tmcldefs.h" local="no" imported="no">tmcl/tmcldefs.h</includes>
    <includes id="motor_8h" name="motor.h" local="no" imported="no">tmcl/motor.h</includes>
    <includes id="convenience_8h" name="convenience.h" local="no" imported="no">tmcl/convenience.h</includes>
    <includes id="interface_8h" name="interface.h" local="no" imported="no">tmcl/interface.h</includes>
  </compound>
  <compound kind="file">
    <name>tmcldefs.c</name>
    <path>/home/rschulze/IKP/Physics/Garching/src/libtmcl/src/tmcl/</path>
    <filename>tmcldefs_8c</filename>
    <includes id="tmcldefs_8h" name="tmcldefs.h" local="yes" imported="no">tmcldefs.h</includes>
    <includes id="motor_8h" name="motor.h" local="yes" imported="no">motor.h</includes>
    <member kind="function">
      <type>void</type>
      <name>tmcl_init</name>
      <anchorfile>tmcldefs_8c.html</anchorfile>
      <anchor>a27ed85719d320cef5cef2b90868bbb9c</anchor>
      <arglist>(TMCLDevice *device)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>tmcl_deinit</name>
      <anchorfile>tmcldefs_8c.html</anchorfile>
      <anchor>ad20a3fa13e8e47d01b384ff9658fdf33</anchor>
      <arglist>(TMCLDevice *device)</arglist>
    </member>
    <member kind="function">
      <type>uint8_t</type>
      <name>tmcl_checksum</name>
      <anchorfile>tmcldefs_8c.html</anchorfile>
      <anchor>a5920c3af8a37f1de4af706aeeadff94a</anchor>
      <arglist>(uint8_t *commands, int length)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_datagram</name>
      <anchorfile>tmcldefs_8c.html</anchorfile>
      <anchor>a2e979701c691c92a81b197fe775a9294</anchor>
      <arglist>(uint8_t *datagram, TMCLDevice device, uint8_t command, uint8_t type, uint32_t value)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_valid_checksum</name>
      <anchorfile>tmcldefs_8c.html</anchorfile>
      <anchor>a371acd071416d76bde976505cc49ad25</anchor>
      <arglist>(TMCLReply reply)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_dgram2reply</name>
      <anchorfile>tmcldefs_8c.html</anchorfile>
      <anchor>a5b33e3430cd2cd2c99dbdc71f49737a8</anchor>
      <arglist>(TMCLReply *reply, uint8_t *datagram, int length)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>tmcldefs.h</name>
    <path>/home/rschulze/IKP/Physics/Garching/src/libtmcl/src/tmcl/</path>
    <filename>tmcldefs_8h</filename>
    <class kind="struct">TMCLDeviceStruct</class>
    <class kind="struct">TMCLReplyStruct</class>
    <class kind="struct">TMCLCommandStruct</class>
    <member kind="define">
      <type>#define</type>
      <name>__TMCL_TMCLDEFS_H_</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>ac5c6df1cce89a8dcd6bd81837eb4934a</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_VERSION</name>
      <anchorfile>group__TMCLMisc.html</anchorfile>
      <anchor>ga420f7d4b6299372763e4ac6ca6d4919a</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_DGRAM_SIZE_CAN</name>
      <anchorfile>group__TMCLMisc.html</anchorfile>
      <anchor>ga7d2c47709a2fef9913f9c4000d68c814</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_DGRAM_SIZE_IIC</name>
      <anchorfile>group__TMCLMisc.html</anchorfile>
      <anchor>gac361bd7186e0b9243b2a8d6dbd465660</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_DGRAM_SIZE_RSXXX</name>
      <anchorfile>group__TMCLMisc.html</anchorfile>
      <anchor>ga893fbfdcd1c9af739173be6476ad1696</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_MAX_DGRAM_SIZE</name>
      <anchorfile>group__TMCLMisc.html</anchorfile>
      <anchor>gad1cf3cae816b86b67bb50098b690a010</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_MAX_PAR_NO</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>aae669e3d19a319c69330de57574c24b9</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STATUS_SUCCESS</name>
      <anchorfile>group__StatusCodes.html</anchorfile>
      <anchor>gae8f0d829c003e2daf2b4d659f10fb365</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STATUS_LOADED_EEPROM</name>
      <anchorfile>group__StatusCodes.html</anchorfile>
      <anchor>gae781af2133cc40ed37e50627769f75f3</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STATUS_WRONG_CHECKSUM</name>
      <anchorfile>group__StatusCodes.html</anchorfile>
      <anchor>gaf588b372da14d242fc4ecb4e144b5085</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STATUS_INVALID_COMMAND</name>
      <anchorfile>group__StatusCodes.html</anchorfile>
      <anchor>ga61d064f4c9f910aeb110a92489664d48</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STATUS_WRONG_TYPE</name>
      <anchorfile>group__StatusCodes.html</anchorfile>
      <anchor>ga9fffa59df78430367ff93cabf36f72c6</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STATUS_INVALID_VALUE</name>
      <anchorfile>group__StatusCodes.html</anchorfile>
      <anchor>ga0d34bdc73a05adf2c2bc7e6038fb6c64</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STATUS_EEPROM_LOCKED</name>
      <anchorfile>group__StatusCodes.html</anchorfile>
      <anchor>gab3c467b9ae2a256a4d62dd4e7e1922af</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STATUS_COMMAND_NA</name>
      <anchorfile>group__StatusCodes.html</anchorfile>
      <anchor>gade3c304cd225d35cad340c7fdff3a801</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_ROR</name>
      <anchorfile>group__MotionComm.html</anchorfile>
      <anchor>gae60969d45c586023c9bd2db9498cc508</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_ROL</name>
      <anchorfile>group__MotionComm.html</anchorfile>
      <anchor>ga90f30df41b6fa29a3e94c909e655af94</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_MST</name>
      <anchorfile>group__MotionComm.html</anchorfile>
      <anchor>ga94462741a6a5efcf6b175294cb9b6ecf</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_MVP</name>
      <anchorfile>group__MotionComm.html</anchorfile>
      <anchor>ga109d51fee8df715b9e18b6c49b785757</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_RFS</name>
      <anchorfile>group__MotionComm.html</anchorfile>
      <anchor>ga316ddf99f164783c8488c48ce9346c21</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_SAP</name>
      <anchorfile>group__ParComm.html</anchorfile>
      <anchor>ga9d041a48b17f51e16e6219d3cfe5a2ca</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_GAP</name>
      <anchorfile>group__ParComm.html</anchorfile>
      <anchor>gaeac28ca289b13b735506291521646a4a</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STAP</name>
      <anchorfile>group__ParComm.html</anchorfile>
      <anchor>ga22d01b4d2941ab2a2881f17975424f41</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_RSAP</name>
      <anchorfile>group__ParComm.html</anchorfile>
      <anchor>gab338e76ee77e5f122d1694c728beb5e3</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_SGP</name>
      <anchorfile>group__ParComm.html</anchorfile>
      <anchor>ga12919729038b159bb1f9b275c9c8f5bc</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_GGP</name>
      <anchorfile>group__ParComm.html</anchorfile>
      <anchor>ga4bf884d087a29a85073718bbd0d4f928</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STGP</name>
      <anchorfile>group__ParComm.html</anchorfile>
      <anchor>ga209b905332339e2b52a7166f46ef2db9</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_RSGP</name>
      <anchorfile>group__ParComm.html</anchorfile>
      <anchor>ga21517120fb13310ef4416fd370fa91b6</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_SIO</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gac92473e5d6624712eb0c6e3b96e72556</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_GIO</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gaf8c91f7e3398565e620f87695e2ac8aa</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CALC</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gaaca5ca8ff4397dde2a1d974a08dfc97d</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_COMP</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gab3445bd6ed45c31f3ed3f4db49914bbd</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_JC</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gae98b22b798475ff3262efec2168b98a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_JA</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga7516bcd7048ea0be08c282cfb65232dc</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CSUB</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga42c0ac92b2357e8833d3294b36f3ce03</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_RSUB</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gab5dbf5f5909e2c59d70ddf48dd6d68fe</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_WAIT</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga3c134dcd5083b786adf60d3240cdee87</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STOP</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga85496061c9785e9cc81068564f72d11a</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_SAC</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gaa5bb837c0debc7de9548dcd55f233cda</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_SCO</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga98541d48d1c0ae966624414f02869164</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_GCO</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gadfdbd63f01a0e7148e6ad2ac5c7aa3f1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CCO</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga55f02944bc20337ded009ae3a22a2e19</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CALCX</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gad58eac496f0281febc26c7302e0f7236</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AAP</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gadda3b3b029a3c196e05bc3fbb6e9f4c0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AGP</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gae139fce6d594db73457f09527562468c</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CLE</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gadf8bf4f9343f77c0787ab0f131fbc92a</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_UF0</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga452f379acd2362b3694cc2332a2ad4c0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_UF1</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga04c7b2800e3c01ac91161f7f680ecea0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_UF2</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga91dd885d4a0e3d69623d4323ca1d64df</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_UF3</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gae6e8731e90f75bc9b1218560f3640926</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_UF4</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga24ceb335f6461de5fb3c2bd27cbb7823</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_UF5</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga76c1ecb8e0999fac3d42b5ae4e8cc076</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_UF6</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gab5c21ab342d5fd4f5df3f5a0b286ccd1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_UF7</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gaf16a383aac035a9bcf695ecd66ca8df2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_STOP</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>gaa9e1148b7664ea0b5a78f845332b4fd7</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_RUN</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>ga22166cf0f91912ea37048297d8030247</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_STEP</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>ga0ffb8262b5b83a477e839844789fe986</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_RST</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>ga433f27b92ba499465f7eab488fbd3cea</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_DLM_START</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>gab0ffec97bdd896d0d98eacf2c80ac946</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_DLM_QUIT</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>gaff3c81037366905174f34c8406f058c7</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_READMEM</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>ga9d883e9bae5236c285877f884bb8a613</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_STATUS</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>gaf8364761b483fed9c95abaedffcf0ec2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_FW_VER</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>gaac0228cc9a707b904b510de74a7fb505</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_FACTORY</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>gab41e9c01de441b30b228801e51243895</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_ASCII</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>ga36f62eadca8ba64c832ac6120f5a372a</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_MVP_ABS</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gafb1f96d5d46a081eaafdf4d8172e5417</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_MVP_REL</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gabb48ea6fc019299ba3081da7be7a1cdb</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_MVP_COORD</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gab1bd55bf2087a0fa580a7ed196b731b2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_RFS_START</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga8ecbfcad4ab934cc6b3b4c90f07a5ba6</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_RFS_STOP</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gadad6e89adaf4b2c93c8afd785b3aeb29</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_RFS_STATUS</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gadc8231e2815a936cb84f36f75da3ca02</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_TARGET_POS</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga87dfb3db656c898683ae4a5dd80e789a</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_CURR_POS</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga46ffdf772b16b88c99f5b48893b3f710</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_TARGET_SPEED</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga9f34f155a65163069922f5f20c4c63b5</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_MAX_POS_SPEED</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>gafeecf0d7ec4c89beea4eb6e5dd3d5326</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_MAX_ACCEL</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga5f18e570598b33d3d77b0d0894d81dc7</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_ABS_CURRENT</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>gaaf8d5010f2cf9799b5321358b5f5fb35</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_STBY_CURRENT</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga7e4a74f86decbbced917fb7825aef450</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_DISABLE_LIMIT_R</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga126f3a0bebd82760451aeadab91d6e06</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_DISABLE_LIMIT_L</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga36067071d35368d2a1b03ddfae1d4eb9</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_SR_PRESC</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>gab96353fcd1f433ef38ea445f812d2616</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_MICROSTEPS</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>gaaf9500c37e13a506bcebb07378bb559c</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_MAX_CURR_REST</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga6c4829576ea5ead497c9fd6bc564ecf0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_MAX_CURR_LOW_ACCEL</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>gad989938d2101b5e000d5f41ca1d2a522</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_MAX_CURR_HIGH_ACCEL</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga1a3faf0da53cb9d7cc2a84cc326ccc4a</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_RFS_MODE</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>gaf504e536f23e990387a1b4421fcc49e4</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_RFS_SPEED</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga4c6ebda674b3ce393db587761c169515</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_RFS_SW_SPEED</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga31404aaf7195272cd4a6ef150d6ea421</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_CURR_SPEED</name>
      <anchorfile>group__ROParam.html</anchorfile>
      <anchor>ga3473b35e8f38849da91e101a751b474d</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_POS_REACHED</name>
      <anchorfile>group__ROParam.html</anchorfile>
      <anchor>ga8340c6753a1858eae01d9a7a0f1ea221</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_LIMIT_R</name>
      <anchorfile>group__ROParam.html</anchorfile>
      <anchor>ga389a6e3b6ba6e1bc1ad719f055bf139f</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_LIMIT_L</name>
      <anchorfile>group__ROParam.html</anchorfile>
      <anchor>ga4751b3398d03d02e756d6b564a735b51</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>int32_t</type>
      <name>TMCLParameter</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a1c27da9ad00f668a659641ec0b94b9ce</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>TMCLParameter</type>
      <name>TMCLParameters</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>af6bebda82514db085eba2fb6711976cc</anchor>
      <arglist>[TMCL_MAX_PAR_NO+1]</arglist>
    </member>
    <member kind="typedef">
      <type>enum tmcl_busses</type>
      <name>TMCLBusType</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>ad26e4e286a55d7c739fd473d8cdd882e</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>enum TMCLModelEnum</type>
      <name>TMCLModel</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a35c090090de43d9850d0f573f7d29e45</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>struct TMCLDeviceStruct</type>
      <name>TMCLDevice</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>adf97b172ea75c2fd91bf4ab98f65ffea</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>struct TMCLReplyStruct</type>
      <name>TMCLReply</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>ac5261105efa5a31da90627f0cb2153d2</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>struct TMCLCommandStruct</type>
      <name>TMCLCommand</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a61ff3e5938eeb8d7a5b41fcba8f7c914</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>tmcl_busses</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a3c0af0cc3f62b9e4a1daea7839da918e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TMCL_CAN</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a3c0af0cc3f62b9e4a1daea7839da918eaf9dbccd234fb0d6fa5cc9e228e3219fd</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TMCL_RSXXX</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a3c0af0cc3f62b9e4a1daea7839da918eaeebe71669361b77c7409940d04d22cc5</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TMCL_IIC</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a3c0af0cc3f62b9e4a1daea7839da918ea27b661ff5f5dd238584fb2765764c314</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TMCL_NONE</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a3c0af0cc3f62b9e4a1daea7839da918eae1c14eefd4ba053ee83ed080d85c8971</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>TMCLModelEnum</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a5b6ac18c2401b554e24fe3313eda6e9a</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TMCM300</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a5b6ac18c2401b554e24fe3313eda6e9aacf81076a68a2e93d0d78e11c3c241a65</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TMCM301</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a5b6ac18c2401b554e24fe3313eda6e9aa8e6b450903c9e2cae2e5eb99e3e74467</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TMCM302</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a5b6ac18c2401b554e24fe3313eda6e9aa8bdcff6dcfcf488fc958ca47ecfd19cb</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TMCM303</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a5b6ac18c2401b554e24fe3313eda6e9aa31f54f81317e016a8f3596d0e81b0396</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TMCM310</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a5b6ac18c2401b554e24fe3313eda6e9aace134b21b8249de1085743749015c3d3</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TMCM11x</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a5b6ac18c2401b554e24fe3313eda6e9aa387914281e7a40ff81cf1906ae4b938b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TMCM109</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a5b6ac18c2401b554e24fe3313eda6e9aaba0fcc6b784d4e85e25095b304373869</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TMCM110</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a5b6ac18c2401b554e24fe3313eda6e9aafdf19449aaf1bf2abcac9ee1e58a3207</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TMCM100</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a5b6ac18c2401b554e24fe3313eda6e9aa9a54f297ca02c20ceabebc926a90d5ae</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TMCM610</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a5b6ac18c2401b554e24fe3313eda6e9aa4d0773732a828d83cc129067791f65a4</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TMCM611</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a5b6ac18c2401b554e24fe3313eda6e9aa04fd42d7ff7fcaea62ef4ce5b068f490</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TMCM612</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a5b6ac18c2401b554e24fe3313eda6e9aa7cfc6fad718d6e52e83c608c794953cb</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>tmcl_init</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a4843aec6363ff7b374b5fe190e17fe6e</anchor>
      <arglist>(TMCLDevice *)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>tmcl_deinit</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a59f577127efc6cc200f6212a19b75f62</anchor>
      <arglist>(TMCLDevice *)</arglist>
    </member>
    <member kind="function">
      <type>uint8_t</type>
      <name>tmcl_checksum</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>aa22a7985c0afc7af2f169f47be7aa3d1</anchor>
      <arglist>(uint8_t *, int)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_datagram</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a8ae83ae40ca930afde6db90ea0b9cb5c</anchor>
      <arglist>(uint8_t *, TMCLDevice, uint8_t, uint8_t, uint32_t)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_valid_checksum</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a36bab56c5448f75e81543f5e1d5855dc</anchor>
      <arglist>(TMCLReply)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>tmcl_dgram2reply</name>
      <anchorfile>tmcldefs_8h.html</anchorfile>
      <anchor>a946609ef74e832b772d1047f5cd809d0</anchor>
      <arglist>(TMCLReply *, uint8_t *, int)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>TMCLMisc</name>
    <title>Misc defines</title>
    <filename>group__TMCLMisc.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_VERSION</name>
      <anchorfile>group__TMCLMisc.html</anchorfile>
      <anchor>ga420f7d4b6299372763e4ac6ca6d4919a</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_DGRAM_SIZE_CAN</name>
      <anchorfile>group__TMCLMisc.html</anchorfile>
      <anchor>ga7d2c47709a2fef9913f9c4000d68c814</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_DGRAM_SIZE_IIC</name>
      <anchorfile>group__TMCLMisc.html</anchorfile>
      <anchor>gac361bd7186e0b9243b2a8d6dbd465660</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_DGRAM_SIZE_RSXXX</name>
      <anchorfile>group__TMCLMisc.html</anchorfile>
      <anchor>ga893fbfdcd1c9af739173be6476ad1696</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_MAX_DGRAM_SIZE</name>
      <anchorfile>group__TMCLMisc.html</anchorfile>
      <anchor>gad1cf3cae816b86b67bb50098b690a010</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>StatusCodes</name>
    <title>Status Codes.</title>
    <filename>group__StatusCodes.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STATUS_SUCCESS</name>
      <anchorfile>group__StatusCodes.html</anchorfile>
      <anchor>gae8f0d829c003e2daf2b4d659f10fb365</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STATUS_LOADED_EEPROM</name>
      <anchorfile>group__StatusCodes.html</anchorfile>
      <anchor>gae781af2133cc40ed37e50627769f75f3</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STATUS_WRONG_CHECKSUM</name>
      <anchorfile>group__StatusCodes.html</anchorfile>
      <anchor>gaf588b372da14d242fc4ecb4e144b5085</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STATUS_INVALID_COMMAND</name>
      <anchorfile>group__StatusCodes.html</anchorfile>
      <anchor>ga61d064f4c9f910aeb110a92489664d48</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STATUS_WRONG_TYPE</name>
      <anchorfile>group__StatusCodes.html</anchorfile>
      <anchor>ga9fffa59df78430367ff93cabf36f72c6</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STATUS_INVALID_VALUE</name>
      <anchorfile>group__StatusCodes.html</anchorfile>
      <anchor>ga0d34bdc73a05adf2c2bc7e6038fb6c64</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STATUS_EEPROM_LOCKED</name>
      <anchorfile>group__StatusCodes.html</anchorfile>
      <anchor>gab3c467b9ae2a256a4d62dd4e7e1922af</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STATUS_COMMAND_NA</name>
      <anchorfile>group__StatusCodes.html</anchorfile>
      <anchor>gade3c304cd225d35cad340c7fdff3a801</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>TMCLComm</name>
    <title>TMCL commands.</title>
    <filename>group__TMCLComm.html</filename>
    <subgroup>MotionComm</subgroup>
    <subgroup>ParComm</subgroup>
    <subgroup>CTLFuncs</subgroup>
    <subgroup>TypeCodes</subgroup>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_SIO</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gac92473e5d6624712eb0c6e3b96e72556</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_GIO</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gaf8c91f7e3398565e620f87695e2ac8aa</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CALC</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gaaca5ca8ff4397dde2a1d974a08dfc97d</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_COMP</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gab3445bd6ed45c31f3ed3f4db49914bbd</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_JC</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gae98b22b798475ff3262efec2168b98a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_JA</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga7516bcd7048ea0be08c282cfb65232dc</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CSUB</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga42c0ac92b2357e8833d3294b36f3ce03</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_RSUB</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gab5dbf5f5909e2c59d70ddf48dd6d68fe</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_WAIT</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga3c134dcd5083b786adf60d3240cdee87</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STOP</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga85496061c9785e9cc81068564f72d11a</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_SAC</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gaa5bb837c0debc7de9548dcd55f233cda</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_SCO</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga98541d48d1c0ae966624414f02869164</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_GCO</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gadfdbd63f01a0e7148e6ad2ac5c7aa3f1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CCO</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga55f02944bc20337ded009ae3a22a2e19</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CALCX</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gad58eac496f0281febc26c7302e0f7236</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AAP</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gadda3b3b029a3c196e05bc3fbb6e9f4c0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AGP</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gae139fce6d594db73457f09527562468c</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CLE</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gadf8bf4f9343f77c0787ab0f131fbc92a</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_UF0</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga452f379acd2362b3694cc2332a2ad4c0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_UF1</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga04c7b2800e3c01ac91161f7f680ecea0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_UF2</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga91dd885d4a0e3d69623d4323ca1d64df</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_UF3</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gae6e8731e90f75bc9b1218560f3640926</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_UF4</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga24ceb335f6461de5fb3c2bd27cbb7823</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_UF5</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga76c1ecb8e0999fac3d42b5ae4e8cc076</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_UF6</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gab5c21ab342d5fd4f5df3f5a0b286ccd1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_UF7</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gaf16a383aac035a9bcf695ecd66ca8df2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_MVP_ABS</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gafb1f96d5d46a081eaafdf4d8172e5417</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_MVP_REL</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gabb48ea6fc019299ba3081da7be7a1cdb</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_MVP_COORD</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gab1bd55bf2087a0fa580a7ed196b731b2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_RFS_START</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>ga8ecbfcad4ab934cc6b3b4c90f07a5ba6</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_RFS_STOP</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gadad6e89adaf4b2c93c8afd785b3aeb29</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_RFS_STATUS</name>
      <anchorfile>group__TMCLComm.html</anchorfile>
      <anchor>gadc8231e2815a936cb84f36f75da3ca02</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>MotionComm</name>
    <title>Motion commands.</title>
    <filename>group__MotionComm.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_ROR</name>
      <anchorfile>group__MotionComm.html</anchorfile>
      <anchor>gae60969d45c586023c9bd2db9498cc508</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_ROL</name>
      <anchorfile>group__MotionComm.html</anchorfile>
      <anchor>ga90f30df41b6fa29a3e94c909e655af94</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_MST</name>
      <anchorfile>group__MotionComm.html</anchorfile>
      <anchor>ga94462741a6a5efcf6b175294cb9b6ecf</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_MVP</name>
      <anchorfile>group__MotionComm.html</anchorfile>
      <anchor>ga109d51fee8df715b9e18b6c49b785757</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_RFS</name>
      <anchorfile>group__MotionComm.html</anchorfile>
      <anchor>ga316ddf99f164783c8488c48ce9346c21</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>ParComm</name>
    <title>Parameter commands.</title>
    <filename>group__ParComm.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_SAP</name>
      <anchorfile>group__ParComm.html</anchorfile>
      <anchor>ga9d041a48b17f51e16e6219d3cfe5a2ca</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_GAP</name>
      <anchorfile>group__ParComm.html</anchorfile>
      <anchor>gaeac28ca289b13b735506291521646a4a</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STAP</name>
      <anchorfile>group__ParComm.html</anchorfile>
      <anchor>ga22d01b4d2941ab2a2881f17975424f41</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_RSAP</name>
      <anchorfile>group__ParComm.html</anchorfile>
      <anchor>gab338e76ee77e5f122d1694c728beb5e3</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_SGP</name>
      <anchorfile>group__ParComm.html</anchorfile>
      <anchor>ga12919729038b159bb1f9b275c9c8f5bc</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_GGP</name>
      <anchorfile>group__ParComm.html</anchorfile>
      <anchor>ga4bf884d087a29a85073718bbd0d4f928</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_STGP</name>
      <anchorfile>group__ParComm.html</anchorfile>
      <anchor>ga209b905332339e2b52a7166f46ef2db9</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_RSGP</name>
      <anchorfile>group__ParComm.html</anchorfile>
      <anchor>ga21517120fb13310ef4416fd370fa91b6</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>CTLFuncs</name>
    <title>TMCL Control Functions</title>
    <filename>group__CTLFuncs.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_STOP</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>gaa9e1148b7664ea0b5a78f845332b4fd7</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_RUN</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>ga22166cf0f91912ea37048297d8030247</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_STEP</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>ga0ffb8262b5b83a477e839844789fe986</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_RST</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>ga433f27b92ba499465f7eab488fbd3cea</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_DLM_START</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>gab0ffec97bdd896d0d98eacf2c80ac946</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_DLM_QUIT</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>gaff3c81037366905174f34c8406f058c7</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_READMEM</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>ga9d883e9bae5236c285877f884bb8a613</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_STATUS</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>gaf8364761b483fed9c95abaedffcf0ec2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_FW_VER</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>gaac0228cc9a707b904b510de74a7fb505</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_FACTORY</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>gab41e9c01de441b30b228801e51243895</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_CTL_ASCII</name>
      <anchorfile>group__CTLFuncs.html</anchorfile>
      <anchor>ga36f62eadca8ba64c832ac6120f5a372a</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>TypeCodes</name>
    <title>TMCL operation type codes.</title>
    <filename>group__TypeCodes.html</filename>
  </compound>
  <compound kind="group">
    <name>AxisParam</name>
    <title>Axis Parameters</title>
    <filename>group__AxisParam.html</filename>
    <subgroup>RWParam</subgroup>
    <subgroup>ROParam</subgroup>
  </compound>
  <compound kind="group">
    <name>RWParam</name>
    <title>Read-Write Parameters</title>
    <filename>group__RWParam.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_TARGET_POS</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga87dfb3db656c898683ae4a5dd80e789a</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_CURR_POS</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga46ffdf772b16b88c99f5b48893b3f710</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_TARGET_SPEED</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga9f34f155a65163069922f5f20c4c63b5</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_MAX_POS_SPEED</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>gafeecf0d7ec4c89beea4eb6e5dd3d5326</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_MAX_ACCEL</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga5f18e570598b33d3d77b0d0894d81dc7</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_ABS_CURRENT</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>gaaf8d5010f2cf9799b5321358b5f5fb35</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_STBY_CURRENT</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga7e4a74f86decbbced917fb7825aef450</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_DISABLE_LIMIT_R</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga126f3a0bebd82760451aeadab91d6e06</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_DISABLE_LIMIT_L</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga36067071d35368d2a1b03ddfae1d4eb9</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_SR_PRESC</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>gab96353fcd1f433ef38ea445f812d2616</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_MICROSTEPS</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>gaaf9500c37e13a506bcebb07378bb559c</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_MAX_CURR_REST</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga6c4829576ea5ead497c9fd6bc564ecf0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_MAX_CURR_LOW_ACCEL</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>gad989938d2101b5e000d5f41ca1d2a522</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_MAX_CURR_HIGH_ACCEL</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga1a3faf0da53cb9d7cc2a84cc326ccc4a</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_RFS_MODE</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>gaf504e536f23e990387a1b4421fcc49e4</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_RFS_SPEED</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga4c6ebda674b3ce393db587761c169515</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_RFS_SW_SPEED</name>
      <anchorfile>group__RWParam.html</anchorfile>
      <anchor>ga31404aaf7195272cd4a6ef150d6ea421</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>ROParam</name>
    <title>Read-Only Parameters</title>
    <filename>group__ROParam.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_CURR_SPEED</name>
      <anchorfile>group__ROParam.html</anchorfile>
      <anchor>ga3473b35e8f38849da91e101a751b474d</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_POS_REACHED</name>
      <anchorfile>group__ROParam.html</anchorfile>
      <anchor>ga8340c6753a1858eae01d9a7a0f1ea221</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_LIMIT_R</name>
      <anchorfile>group__ROParam.html</anchorfile>
      <anchor>ga389a6e3b6ba6e1bc1ad719f055bf139f</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>TMCL_AP_LIMIT_L</name>
      <anchorfile>group__ROParam.html</anchorfile>
      <anchor>ga4751b3398d03d02e756d6b564a735b51</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>TMCLCommandStruct</name>
    <filename>structTMCLCommandStruct.html</filename>
    <member kind="variable">
      <type>uint8_t</type>
      <name>command</name>
      <anchorfile>structTMCLCommandStruct.html</anchorfile>
      <anchor>a854a52c07ac09c05f30561380a1490fe</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>uint8_t</type>
      <name>type</name>
      <anchorfile>structTMCLCommandStruct.html</anchorfile>
      <anchor>ae007ea99cf6d0c077179ba55dd565753</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>uint32_t</type>
      <name>value</name>
      <anchorfile>structTMCLCommandStruct.html</anchorfile>
      <anchor>a46541ffc394c6c80950436398ba13266</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>TMCLDeviceStruct</name>
    <filename>structTMCLDeviceStruct.html</filename>
    <member kind="variable">
      <type>uint8_t</type>
      <name>address</name>
      <anchorfile>structTMCLDeviceStruct.html</anchorfile>
      <anchor>aa56aa12a3dc7d9bb5bae52937390ce10</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>uint8_t</type>
      <name>bank</name>
      <anchorfile>structTMCLDeviceStruct.html</anchorfile>
      <anchor>aa388813983ca862282b187ba8ca70138</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>TMCLBusType</type>
      <name>bus</name>
      <anchorfile>structTMCLDeviceStruct.html</anchorfile>
      <anchor>aa6e5ebc3dd114b186a4ac2276a2dd5a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>TMCLModel</type>
      <name>model</name>
      <anchorfile>structTMCLDeviceStruct.html</anchorfile>
      <anchor>a3c710b5d01b3070e5971614d51ff91ff</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>num_refswitches</name>
      <anchorfile>structTMCLDeviceStruct.html</anchorfile>
      <anchor>a5988d034898432c253ca780b971b4165</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>TMCLParameters</type>
      <name>parameter</name>
      <anchorfile>structTMCLDeviceStruct.html</anchorfile>
      <anchor>a95bdba1d9decf882fd8a03b2b2b08373</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>TMCLInterfaceStruct</name>
    <filename>structTMCLInterfaceStruct.html</filename>
    <member kind="variable">
      <type>union TMCLInterfaceStruct::@0</type>
      <name>handle</name>
      <anchorfile>structTMCLInterfaceStruct.html</anchorfile>
      <anchor>a32dd1aec6b11ffd4af19f56917a5809a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>fd</name>
      <anchorfile>unionTMCLInterfaceStruct_1_1@0.html</anchorfile>
      <anchor>ab4512174f1121e86ddf1b6df7ef011f3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>char *</type>
      <name>ifacename</name>
      <anchorfile>structTMCLInterfaceStruct.html</anchorfile>
      <anchor>a4f925de555bdc1c95a05345d767fa104</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>TMCLBusType</type>
      <name>bus</name>
      <anchorfile>structTMCLInterfaceStruct.html</anchorfile>
      <anchor>ae34c6fdc322e95d6eac964203b6b2ab5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>tmcl_open_funcPtr</type>
      <name>_open</name>
      <anchorfile>structTMCLInterfaceStruct.html</anchorfile>
      <anchor>a45748d0c9af5e9452a964bffd971d644</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>void *</type>
      <name>tmcl_open_void</name>
      <anchorfile>structTMCLInterfaceStruct.html</anchorfile>
      <anchor>af15b6916e8874e2276df5953e3c39781</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>tmcl_close_funcPtr</type>
      <name>_close</name>
      <anchorfile>structTMCLInterfaceStruct.html</anchorfile>
      <anchor>a3b2fe6c508be6bce1b67837641a88555</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>void *</type>
      <name>tmcl_close_void</name>
      <anchorfile>structTMCLInterfaceStruct.html</anchorfile>
      <anchor>a0bb104a6c9e2e8adb097ed7261b008ad</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>tmcl_write_funcPtr</type>
      <name>_write</name>
      <anchorfile>structTMCLInterfaceStruct.html</anchorfile>
      <anchor>a9eea8dbe2219cbc0a35d2ac19684990a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>void *</type>
      <name>tmcl_write_void</name>
      <anchorfile>structTMCLInterfaceStruct.html</anchorfile>
      <anchor>acfb8740deb4a8a5ce6b7882866a93815</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>tmcl_read_funcPtr</type>
      <name>_read</name>
      <anchorfile>structTMCLInterfaceStruct.html</anchorfile>
      <anchor>a766d5b0b2659e759696912d850026141</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>void *</type>
      <name>tmcl_read_void</name>
      <anchorfile>structTMCLInterfaceStruct.html</anchorfile>
      <anchor>abaa02120f923776a8b238d45b6ca68b9</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>unsigned int</type>
      <name>timeout_sec</name>
      <anchorfile>structTMCLInterfaceStruct.html</anchorfile>
      <anchor>a6fc25e45d20014501e64c14eb05faadf</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>unsigned int</type>
      <name>timeout_msec</name>
      <anchorfile>structTMCLInterfaceStruct.html</anchorfile>
      <anchor>af4cb989ea551afbad2d6150cb9bbe312</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>unsigned int</type>
      <name>timewait_sec</name>
      <anchorfile>structTMCLInterfaceStruct.html</anchorfile>
      <anchor>a145d56a20944085a1447ca7b58cbfbee</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>unsigned int</type>
      <name>timewait_msec</name>
      <anchorfile>structTMCLInterfaceStruct.html</anchorfile>
      <anchor>abb8e42924a82e082614dee2768229736</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>TMCLMotorStruct</name>
    <filename>structTMCLMotorStruct.html</filename>
    <member kind="variable">
      <type>TMCLDevice</type>
      <name>device</name>
      <anchorfile>structTMCLMotorStruct.html</anchorfile>
      <anchor>a035fa87a12ac1eb2cd585273080c3951</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>TMCLInterface *</type>
      <name>iface</name>
      <anchorfile>structTMCLMotorStruct.html</anchorfile>
      <anchor>ae6d556412ee1450882d073678811e753</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>TMCLReplyStruct</name>
    <filename>structTMCLReplyStruct.html</filename>
    <member kind="variable">
      <type>uint8_t</type>
      <name>reply_address</name>
      <anchorfile>structTMCLReplyStruct.html</anchorfile>
      <anchor>aa7bdb24d8ec498df4a2d2b067211a344</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>uint8_t</type>
      <name>module_address</name>
      <anchorfile>structTMCLReplyStruct.html</anchorfile>
      <anchor>ae3ebaa97b939afc79eb0efe8c6ba7e4f</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>uint8_t</type>
      <name>status</name>
      <anchorfile>structTMCLReplyStruct.html</anchorfile>
      <anchor>a74072ff7b4d9d12df630545839131196</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>uint8_t</type>
      <name>command</name>
      <anchorfile>structTMCLReplyStruct.html</anchorfile>
      <anchor>a40395664fbaf18959cc62531d965a790</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>uint32_t</type>
      <name>value</name>
      <anchorfile>structTMCLReplyStruct.html</anchorfile>
      <anchor>aace5a128745c0f5b680a160b36cfaea6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>uint8_t</type>
      <name>checksum</name>
      <anchorfile>structTMCLReplyStruct.html</anchorfile>
      <anchor>a64e2a7a1aedc90e4ba9200dcea006469</anchor>
      <arglist></arglist>
    </member>
  </compound>
</tagfile>
