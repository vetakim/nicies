from IPython.terminal.prompts import Prompts, Token
import os

class MyPrompt(Prompts):
    def in_prompt_tokens(self, cli=None):
        return [
                (Token.PromptNum, str(self.shell.execution_count)),
                (Token.Prompt, ' %s ' % os.getcwd()),
                (Token.Prompt, ' ')]

    def out_prompt_tokens(self, cli=None):
        return [
                (Token.OutPromptNum, str(self.shell.execution_count)),
                (Token.OutPrompt, '  ')]

ip = get_ipython()
ip.prompts = MyPrompt(ip)
