/* Swig interface file */
%module tmcl
%{
#include "tmcl/tmcldefs.h"
#include "tmcl/motor.h"
#include "tmcl/convenience.h"
#include "tmcl/interface.h"



%}

%include "tmcl/tmcldefs.h"
%include "tmcl/motor.h"
%include "tmcl/convenience.h"
%include "tmcl/interface.h"

typedef  unsigned char uint8_t;
typedef  long int32_t;

%extend TMCLInterface {

    TMCLInterface(TMCLBusType bustype) {
    
        TMCLInterface *iface;
        tmcl_init_interface(&iface, bustype, NULL, NULL, NULL, NULL); 
        return iface;
    }
    
    int open(char *filename) {
        return tmcl_open_interface($self, filename);
    }
    
    int close() {
        return tmcl_close_interface($self);
    }
    
    ~TMCLInterface() {
        tmcl_deinit_interface(&$self);
    }
}



%extend TMCLMotor {

        TMCLMotor(TMCLInterface *iface, TMCLModel model,
                    uint8_t address, uint8_t bank, TMCLBusType bus) {
            
            TMCLMotor *motor;
                
            tmcl_init_motor(&motor, iface, model, address, bank, bus);
            return motor;            
        }
        
        ~TMCLMotor() {

            tmcl_deinit_motor(&$self);
        }
        /*
        int move_to_pos_abs(int position) {
            return tmcl_move_to_pos_abs($self, position);
        }
        
        int move_to_pos_rel(int distance) {
            return tmcl_move_to_pos_rel($self, distance);
        }
 
        int move_to_coord(int coordinate) {
            return tmcl_move_to_coord($self, coordinate);
        }
        
        int stop() {
            return tmcl_stop($self);
        }
        
        int set_max_current(unsigned int current) {
            return tmcl_set_max_current($self, current);
        }

        int get_max_current() {
            return tmcl_get_max_current($self);
        }
        
        int refsearch_start() {
            return tmcl_refsearch_start($self);    
        }
        
        int refsearch_stop() {
            return tmcl_refsearch_stop($self);    
        }
        
        int refsearch_status() {
            return tmcl_refsearch_status($self);
        }

        int32_t get_position() {
            return tmcl_get_position($self); 
        }
        
        int ror(int velocity) {
            return tmcl_ror($self, velocity);
        }

        int rol(int velocity) {
            return tmcl_rol($self,velocity);
        }                
        
        int set_max_standby_current(unsigned int current) {
            return tmcl_set_max_standby_current($self, current);        
        }

        int get_max_current() {
            return tmcl_get_max_current($self);
        }
        
        int set_microsteps(int microsteps) {
            return tmcl_set_microsteps($self, microsteps);
        }
        
        int get_microsteps() {
            return tmcl_get_microsteps($self);
        }

        int activate_limit_switch(int limitSwitchID) {
            return tmcl_activate_limit_switch($self, limitSwitchID);
        }

        int deactivate_limit_switch(int limitSwitchID) {
            return tmcl_deactivate_limit_switch($self, limitSwitchID);
        }
        
        int set_no_ref_switch(int number) {
            return tmcl_set_no_ref_switch($self, number);
        }

        int get_current_speed() {
            return tmcl_get_current_speed($self);
        }

        int set_refsearch_speed(int fraction) {
            return tmcl_set_refsearch_speed($self, fraction);
        }

        int set_pos_speed(int speed) {
            return tmcl_set_pos_speed($self, speed);  
        }
        
        int get_pos_speed() {
            return tmcl_get_pos_speed($self);
        }
        */
};    

