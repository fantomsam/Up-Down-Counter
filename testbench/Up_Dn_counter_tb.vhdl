library ieee;
use ieee.std_logic_1164.all;

entity Up_Dn_counter_tb is
end Up_Dn_counter_tb;

architecture behav of Up_Dn_counter_tb is
   component Up_Dn_counter
     port (
        clk : in std_logic;--1Mhz clock 
        rst : in std_logic;--reset input
        up : in std_logic;
        down : in std_logic;
        C_out : out std_logic_vector(9 downto 0) 
       );
   end component;
   
   signal clk, rst, up, down : std_logic := '0';
   signal C_out : std_logic_vector(9 downto 0);
   constant clk_in_t : time := 1 us;
   begin
   S_c_0: Up_Dn_counter
   port map (
              clk => clk,
              rst => rst,
							up => up,
							down => down,
							c_out => c_out
            );
   entrada_process : process -- clock 
   begin
        clk<= '0';
        wait for clk_in_t / 2;
        clk<= '1';
        wait for clk_in_t/ 2;
   end process;
   stimuli: process
   begin
      rst <= '1';
      wait for 100 ns;
      rst <= '0';
      
			up <= '1';
			down <= '0';
			wait for 800 us;
			up <= '1';
			down <= '1';
			wait for 800 us;
			up <= '0';
			down <= '1';
			wait for 500 us;
			up <= '0';
			down <= '0';	
			wait for 10 ms;		
      assert false report "end of test" severity note;
      wait;
   end process;
end behav;
